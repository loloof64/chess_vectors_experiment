import 'dart:typed_data';
import 'dart:ui' show Color, Offset, Path, Radius;

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tuple/tuple.dart';

class VectorImagePainter extends CustomPainter {
  List<VectorDrawableElement> vectorDefinition;

  VectorImagePainter(this.vectorDefinition);

  @override
  void paint(Canvas canvas, Size size) {
    vectorDefinition.forEach((VectorDrawableElement vectorElement) {
      vectorElement.paintIntoCanvas(canvas, vectorElement.drawingParameters);
    });
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

DrawingParameters mergeDrawingParameters(
    DrawingParameters thisDrawingParameters,
    DrawingParameters parentDrawingParameters) {
  DrawingParameters usedDrawingParameters = DrawingParameters(
      fillColor:
          thisDrawingParameters.fillColor ?? parentDrawingParameters.fillColor,
      strokeColor: thisDrawingParameters.strokeColor ??
          parentDrawingParameters.strokeColor,
      strokeWidth: thisDrawingParameters.strokeWidth ??
          parentDrawingParameters.strokeWidth,
      strokeLineCap: thisDrawingParameters.strokeLineCap ??
          parentDrawingParameters.strokeLineCap,
      strokeLineJoin: thisDrawingParameters.strokeLineJoin ??
          parentDrawingParameters.strokeLineJoin,
      strokeLineMiterLimit: thisDrawingParameters.strokeLineMiterLimit ??
          parentDrawingParameters.strokeLineMiterLimit,
      transformMatrixValues: thisDrawingParameters.transformMatrix ??
          parentDrawingParameters.transformMatrix);
  return usedDrawingParameters;
}

Float64List convertListIntoMatrix4(List<double> matrixValues) {
  if (matrixValues == null) return null;
  return Float64List.fromList(<double>[
    matrixValues[0],
    matrixValues[1],
    0.0,
    0.0,
    matrixValues[2],
    matrixValues[3],
    0.0,
    0.0,
    0.0,
    0.0,
    1.0,
    0.0,
    matrixValues[4],
    matrixValues[5],
    0.0,
    1.0
  ]);
}

class DrawingParameters {
  Color fillColor;
  Color strokeColor;
  double strokeWidth;
  StrokeCap strokeLineCap;
  StrokeJoin strokeLineJoin;
  double strokeLineMiterLimit;
  Float64List transformMatrix;

  DrawingParameters(
      {this.fillColor,
      this.strokeColor,
      this.strokeWidth,
        this.strokeLineCap,
        this.strokeLineJoin,
        this.strokeLineMiterLimit,
      List<double> transformMatrixValues})
      : transformMatrix = convertListIntoMatrix4(transformMatrixValues);

  @override
  String toString() {
    return "DrawingParameters("
        "fillColor = $fillColor,"
        "strokeColor = $strokeColor,"
        "strokeWidth = $strokeWidth,"
        "strokeLineCap = $strokeLineCap,"
        "strokeLineJoin = $strokeLineJoin,"
        "strokeLineMiterLimit = $strokeLineMiterLimit,"
        "transfromMatrix = $transformMatrix"
        ")";
  }
}

abstract class VectorDrawableElement {
  DrawingParameters drawingParameters;

  VectorDrawableElement(this.drawingParameters);

  void paintIntoCanvas(
      Canvas targetCanvas, DrawingParameters parentDrawingParameters);
}

class VectorImageGroup extends VectorDrawableElement {
  List<VectorDrawableElement> children;

  VectorImageGroup({
    this.children,
    DrawingParameters drawingParameters,
  }) : super(drawingParameters);

  @override
  void paintIntoCanvas(
      Canvas targetCanvas, DrawingParameters parentDrawingParameters) {
    DrawingParameters usedDrawingParameters =
        mergeDrawingParameters(drawingParameters, parentDrawingParameters);

    children.forEach((VectorDrawableElement currentChild) {
      currentChild.paintIntoCanvas(targetCanvas, usedDrawingParameters);
    });
  }
}

class VectorImagePathDefinition extends VectorDrawableElement {
  List<PathElement> pathElements;

  VectorImagePathDefinition({
    String path,
    DrawingParameters drawingParameters,
  })  : pathElements = parsePath(path),
        super(drawingParameters);

  @override
  void paintIntoCanvas(
      Canvas targetCanvas, DrawingParameters parentDrawingParameters) {
    DrawingParameters usedDrawingParameters =
        mergeDrawingParameters(drawingParameters, parentDrawingParameters);

    targetCanvas.save();
    if (drawingParameters.transformMatrix != null) {
      targetCanvas.transform(drawingParameters.transformMatrix);
    }

    var commonPath = new Path();
    pathElements.forEach((PathElement element) {
      element.addToPath(commonPath);
    });

    var strokePathPaint = new Paint()
      ..style = PaintingStyle.stroke
      ..color = usedDrawingParameters.strokeColor
      ..strokeWidth = usedDrawingParameters.strokeWidth;
    if (usedDrawingParameters.strokeLineCap != null){
      strokePathPaint.strokeCap = usedDrawingParameters.strokeLineCap;
    }
    if (usedDrawingParameters.strokeLineJoin != null){
      strokePathPaint.strokeJoin = usedDrawingParameters.strokeLineJoin;
    }
    if (usedDrawingParameters.strokeLineMiterLimit != null){
      strokePathPaint.strokeMiterLimit = usedDrawingParameters.strokeLineMiterLimit;
    }
    targetCanvas.drawPath(commonPath, strokePathPaint);

    var fillPathPaint = new Paint()
      ..style = PaintingStyle.fill
      ..color = usedDrawingParameters.fillColor;
    targetCanvas.drawPath(commonPath, fillPathPaint);

    targetCanvas.restore();
  }
}

abstract class PathElement {
  void addToPath(Path path);
}

class MoveElement extends PathElement {
  bool relative;
  Offset moveParams;

  MoveElement({@required this.moveParams, @required this.relative});

  @override // ignore: missing_function_body
  void addToPath(Path path) {
    if (relative) {
      path.relativeMoveTo(moveParams.dx, moveParams.dy);
    } else {
      path.moveTo(moveParams.dx, moveParams.dy);
    }
  }

  @override
  String toString() {
    return "MoveElement("
        "relative = $relative, "
        "moveParams = $moveParams"
        ")";
  }
}

class CloseElement extends PathElement {
  @override
  void addToPath(Path path) {
    path.close();
  }

  @override
  String toString() {
    return "CloseElement()";
  }
}

class LineElement extends PathElement {
  bool relative;
  Offset lineParams;

  LineElement({@required this.lineParams, @required this.relative});

  @override
  void addToPath(Path path) {
    if (relative) {
      path.relativeLineTo(lineParams.dx, lineParams.dy);
    } else {
      path.lineTo(lineParams.dx, lineParams.dy);
    }
  }

  @override
  String toString() {
    return "LineElement("
        "relative = $relative, "
        "lineParams = $lineParams"
        ")";
  }
}

class CubicCurveElement extends PathElement {
  bool relative;
  Offset firstControlPoint;
  Offset secondControlPoint;
  Offset endPoint;

  CubicCurveElement({
    @required this.relative,
    @required this.firstControlPoint,
    @required this.secondControlPoint,
    @required this.endPoint,
  });

  @override
  void addToPath(Path path) {
    if (relative) {
      path.relativeCubicTo(
          firstControlPoint.dx,
          firstControlPoint.dy,
          secondControlPoint.dx,
          secondControlPoint.dy,
          endPoint.dx,
          endPoint.dy);
    } else {
      path.cubicTo(
          firstControlPoint.dx,
          firstControlPoint.dy,
          secondControlPoint.dx,
          secondControlPoint.dy,
          endPoint.dx,
          endPoint.dy);
    }
  }

  @override
  String toString() {
    return "CubicCurveElement("
        "relative = $relative, "
        "firstControlPoint = $firstControlPoint,"
        "secondControlPoint = $secondControlPoint,"
        "endPoint = $endPoint"
        ")";
  }
}

class ArcElement extends PathElement {
  bool relative;
  Offset radius;
  double xAxisRotation;
  Offset center;

  ArcElement(
      {@required this.relative,
      @required this.radius,
      @required this.xAxisRotation,
      @required this.center});

  @override
  void addToPath(Path path) {
    if (relative) {
      path.relativeArcToPoint(
        center,
        rotation: xAxisRotation,
        radius: Radius.elliptical(radius.dx, radius.dy),
      );
    } else {
      path.arcToPoint(
        center,
        rotation: xAxisRotation,
        radius: Radius.elliptical(radius.dx, radius.dy),
      );
    }
  }

  @override
  String toString() {
    return "ArcElement("
        "relative = $relative, "
        "radius = $radius,"
        "xAxisRotation = $xAxisRotation,"
        "center = $center"
        ")";
  }
}

List<List<PathElement>> parsePathList(List<String> pathList) {
  return pathList.map((var currentPathStr) {
    return parsePath(currentPathStr);
  }).toList();
}

List<PathElement> parsePath(String pathStr) {
  Tuple2<PathElement, String> interpretCommand(
      RegExp commandRegex, String input) {
    var commandInterpretation = commandRegex.firstMatch(input);
    if (commandInterpretation == null) return null;

    var commandType = commandInterpretation.group(1);
    var relativeCommand = commandType.toLowerCase() == commandType;
    switch (commandType) {
      case 'M':
      case 'm':
        var element = MoveElement(
            relative: relativeCommand,
            moveParams: Offset(double.parse(commandInterpretation.group(2)),
                double.parse(commandInterpretation.group(3))));
        var remainingPathStr = input.substring(commandInterpretation.end);
        return Tuple2<PathElement, String>(element, remainingPathStr);
      case 'L':
      case 'l':
        var element = LineElement(
            relative: relativeCommand,
            lineParams: Offset(double.parse(commandInterpretation.group(2)),
                double.parse(commandInterpretation.group(3))));
        var remainingPathStr = input.substring(commandInterpretation.end);
        return Tuple2<PathElement, String>(element, remainingPathStr);
      case 'c':
      case 'C':
        var element = CubicCurveElement(
            relative: relativeCommand,
            firstControlPoint: Offset(
                double.parse(commandInterpretation.group(2)),
                double.parse(commandInterpretation.group(3))),
            secondControlPoint: Offset(
                double.parse(commandInterpretation.group(4)),
                double.parse(commandInterpretation.group(5))),
            endPoint: Offset(double.parse(commandInterpretation.group(6)),
                double.parse(commandInterpretation.group(7))));
        var remainingPathStr = input.substring(commandInterpretation.end);
        return Tuple2<PathElement, String>(element, remainingPathStr);
      case 'a':
      case 'A':
        var element = ArcElement(
            relative: relativeCommand,
            radius: Offset(double.parse(commandInterpretation.group(2)),
                double.parse(commandInterpretation.group(3))),
            center: Offset(double.parse(commandInterpretation.group(7)),
                double.parse(commandInterpretation.group(8))),
            xAxisRotation: double.parse(commandInterpretation.group(4)));
        var remainingPathStr = input.substring(commandInterpretation.end);
        return Tuple2<PathElement, String>(element, remainingPathStr);
      case 'z':
      case 'Z':
        var element = CloseElement();
        var remainingPathStr = input.substring(commandInterpretation.end);
        return Tuple2<PathElement, String>(element, remainingPathStr);
    }
    return null;
  }

  String valueFormat = r"(\d+(?:\.\d+)?)";
  String separatorFormat = r"(?:\s+|,)";

  var moveRegex =
      RegExp("^(M|m)$separatorFormat$valueFormat$separatorFormat$valueFormat");
  var lineRegex =
      RegExp("^(L|l)$separatorFormat$valueFormat$separatorFormat$valueFormat");
  var cubicCurveRegex = RegExp(
      "^(C|c)$separatorFormat$valueFormat$separatorFormat" +
          "$valueFormat$separatorFormat$valueFormat$separatorFormat$valueFormat$separatorFormat" +
          "$valueFormat$separatorFormat$valueFormat");
  var arcRegex = RegExp(
      "^(A|a)$separatorFormat$valueFormat$separatorFormat$valueFormat" +
          "$separatorFormat$valueFormat$separatorFormat$valueFormat$separatorFormat$valueFormat" +
          "$separatorFormat$valueFormat$separatorFormat$valueFormat");
  var closeRegex = RegExp("^(z)");

  var elementsToReturn = <PathElement>[];
  var remainingPath = pathStr.trim();

  while (remainingPath.isNotEmpty) {
    var moveElementTuple = interpretCommand(moveRegex, remainingPath);
    var lineElementTuple = interpretCommand(lineRegex, remainingPath);
    var cubicCurveElementTuple =
        interpretCommand(cubicCurveRegex, remainingPath);
    var arcElementTuple = interpretCommand(arcRegex, remainingPath);
    var closeElementTuple = interpretCommand(closeRegex, remainingPath);

    if (moveElementTuple != null) {
      elementsToReturn.add(moveElementTuple.item1);
      remainingPath = moveElementTuple.item2.trim();
    } else if (lineElementTuple != null) {
      elementsToReturn.add(lineElementTuple.item1);
      remainingPath = lineElementTuple.item2.trim();
    } else if (cubicCurveElementTuple != null) {
      elementsToReturn.add(cubicCurveElementTuple.item1);
      remainingPath = cubicCurveElementTuple.item2.trim();
    } else if (arcElementTuple != null) {
      elementsToReturn.add(arcElementTuple.item1);
      remainingPath = arcElementTuple.item2.trim();
    } else if (closeElementTuple != null) {
      elementsToReturn.add(closeElementTuple.item1);
      remainingPath = closeElementTuple.item2.trim();
    } else
      throw "Unrecognized path in $remainingPath !";
  }

  return elementsToReturn;
}
