import 'package:chess_vectors_experiment/vector_image.dart';
import 'package:flutter/material.dart';

class WhitePawn extends BaseVector {
  WhitePawn({Offset position = Offset.zero, double size = 45.0})
      : super(
            drawingZone: position & Size.square(size),
            baseImageSize: 45.0,
            painter:
                VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
              VectorImagePathDefinition(
                  path:
                      "M 22,9 C 19.79,9 18,10.79 18,13 C 18,13.89 18.29,14.71 18.78,15.38"
                      " C 16.83,16.5 15.5,18.59 15.5,21 C 15.5,23.03 16.44,24.84 17.91,26.03"
                      " C 14.91,27.09 10.5,31.58 10.5,39.5 L 33.5,39.5 C 33.5,31.58 29.09,"
                      "27.09 26.09,26.03 C 27.56,24.84 28.5,23.03 28.5,21 C 28.5,18.59"
                      " 27.17,16.5 25.22,15.38 C 25.71,14.71 26,13.89 26,13 C 26,10.79"
                      " 24.21,9 22,9 z ",
                  drawingParameters: DrawingParameters(
                      fillColor: Colors.white,
                      strokeColor: Colors.black,
                      strokeWidth: 1.5,
                      strokeLineCap: StrokeCap.round,
                      strokeLineJoin: StrokeJoin.miter,
                      strokeLineMiterLimit: 4.0))
            ]));
}

class BlackPawn extends BaseVector {
  BlackPawn({Offset position = Offset.zero, double size = 45.0})
      : super(
            drawingZone: position & Size.square(size),
            baseImageSize: 45.0,
            painter:
                VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
              VectorImagePathDefinition(
                  path:
                      "M 22,9 C 19.79,9 18,10.79 18,13 C 18,13.89 18.29,14.71 18.78,15.38"
                      " C 16.83,16.5 15.5,18.59 15.5,21 C 15.5,23.03 16.44,24.84 17.91,26.03"
                      " C 14.91,27.09 10.5,31.58 10.5,39.5 L 33.5,39.5 C 33.5,31.58 29.09,"
                      "27.09 26.09,26.03 C 27.56,24.84 28.5,23.03 28.5,21 C 28.5,18.59"
                      " 27.17,16.5 25.22,15.38 C 25.71,14.71 26,13.89 26,13 C 26,10.79"
                      " 24.21,9 22,9 z ",
                  drawingParameters: DrawingParameters(
                      fillColor: Colors.black,
                      strokeColor: Colors.black,
                      strokeWidth: 1.5,
                      strokeLineCap: StrokeCap.round,
                      strokeLineJoin: StrokeJoin.miter,
                      strokeLineMiterLimit: 4.0))
            ]));
}

class WhiteKnight extends BaseVector {
  WhiteKnight({Offset position = Offset.zero, double size = 45.0})
      : super(
          drawingZone: position & Size.square(size),
          baseImageSize: 45.0,
          painter: VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
            VectorImageGroup(
                children: <VectorDrawableElement>[
                  VectorImagePathDefinition(
                      path: "M 22,10 C 32.5,11 38.5,18 38,39"
                          " L 15,39 C 15,30 25,32.5 23,18",
                      drawingParameters:
                          DrawingParameters(fillColor: Colors.white)),
                  VectorImagePathDefinition(
                      path: "M 24,18 C 24.38,20.91 18.45,25.37"
                          " 16,27 C 13,29 13.18,31.34 11,31 C "
                          "9.958,30.06 12.41,27.96 11,28 C 10,28 11.19,29.23 10,30 C 9,30"
                          " 5.997,31 6,26 C 6,24 12,14 12,14 C 12,14 13.89,12.1 14,10.5 C"
                          " 13.27,9.506 13.5,8.5 13.5,7.5 C 14.5,6.5 16.5,10 16.5,10 L"
                          " 18.5,10 C 18.5,10 19.28,8.008 21,7 C 22,7 22,10 22,10",
                      drawingParameters:
                          DrawingParameters(fillColor: Colors.white)),
                  VectorImagePathDefinition(
                      path: "M 9.5 25.5 A 0.5 0.5 0 1 1"
                          " 8.5,25.5 A 0.5 0.5 0 1 1 9.5 25.5 z",
                      drawingParameters:
                          DrawingParameters(fillColor: Colors.black)),
                  VectorImagePathDefinition(
                      path: "M 15 15.5 A 0.5 1.5 0 1 1"
                          "  14,15.5 A 0.5 1.5 0 1 1  15 15.5 z",
                      drawingParameters: DrawingParameters(
                          fillColor: Colors.black,
                          transformMatrixValues: <double>[
                            0.866,
                            0.5,
                            -0.5,
                            0.866,
                            9.693,
                            -5.173
                          ]))
                ],
                drawingParameters: DrawingParameters(
                    fillColor: null,
                    strokeColor: Colors.black,
                    strokeWidth: 1.5,
                    strokeLineCap: StrokeCap.round,
                    strokeLineJoin: StrokeJoin.round,
                    strokeLineMiterLimit: 4.0))
          ]),
        );
}

class BlackKnight extends BaseVector {
  BlackKnight({Offset position = Offset.zero, double size = 45.0})
      : super(
          drawingZone: position & Size.square(size),
          baseImageSize: 45.0,
          painter: VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
            VectorImageGroup(
                children: <VectorDrawableElement>[
                  VectorImagePathDefinition(
                      path: "M 22,10 C 32.5,11 38.5,18 38,39 L 15,39"
                          " C 15,30 25,32.5 23,18",
                      drawingParameters:
                          DrawingParameters(fillColor: Colors.black)),
                  VectorImagePathDefinition(
                      path:
                          "M 24,18 C 24.38,20.91 18.45,25.37 16,27 C 13,29 13.18,"
                          "31.34 11,31 C 9.958,30.06 12.41,27.96 11,28 C 10,28 11.19,"
                          "29.23 10,30 C 9,30 5.997,31 6,26 C 6,24 12,14 12,14 C 12,14"
                          " 13.89,12.1 14,10.5 C 13.27,9.506 13.5,8.5 13.5,7.5 C 14.5,"
                          "6.5 16.5,10 16.5,10 L 18.5,10 C 18.5,10 19.28,8.008 21,7 C "
                          "22,7 22,10 22,10",
                      drawingParameters:
                          DrawingParameters(fillColor: Colors.black)),
                  VectorImagePathDefinition(
                      path:
                          "M 9.5 25.5 A 0.5 0.5 0 1 1 8.5,25.5 A 0.5 0.5 0 1 1 9.5 25.5 z",
                      drawingParameters: DrawingParameters(
                          fillColor: Colors.white, strokeColor: Colors.white)),
                  VectorImagePathDefinition(
                      path:
                          "M 15 15.5 A 0.5 1.5 0 1 1  14,15.5 A 0.5 1.5 0 1 1  15 15.5 z",
                      drawingParameters: DrawingParameters(
                          fillColor: Colors.white,
                          strokeColor: Colors.white,
                          transformMatrixValues: <double>[
                            0.866,
                            0.5,
                            -0.5,
                            0.866,
                            9.693,
                            -5.173
                          ])),
                  VectorImagePathDefinition(
                      path:
                          "M 24.55,10.4 L 24.1,11.85 L 24.6,12 C 27.75,13 30.25,14.49 "
                          "32.5,18.75 C 34.75,23.01 35.75,29.06 35.25,39 L 35.2,39.5 L "
                          "37.45,39.5 L 37.5,39 C 38,28.94 36.62,22.15 34.25,17.66 C "
                          "31.88,13.17 28.46,11.02 25.06,10.5 L 24.55,10.4 z ",
                      drawingParameters: DrawingParameters(
                          fillColor: Colors.white,
                          strokeColor: Colors.black,
                          strokeWidth: 0.5))
                ],
                drawingParameters: DrawingParameters(
                    fillColor: null,
                    strokeColor: Colors.black,
                    strokeWidth: 1.5,
                    strokeLineCap: StrokeCap.round,
                    strokeLineJoin: StrokeJoin.round,
                    strokeLineMiterLimit: 4.0))
          ]),
        );
}

class WhiteBishop extends BaseVector {
  WhiteBishop({Offset position = Offset.zero, double size = 45.0})
      : super(
            drawingZone: position & Size.square(size),
            baseImageSize: 45.0,
            painter:
                VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
              VectorImageGroup(
                  children: <VectorDrawableElement>[
                    VectorImageGroup(
                        children: <VectorDrawableElement>[
                          VectorImagePathDefinition(
                              path:
                                  "M 9,36 C 12.39,35.03 19.11,36.43 22.5,34 C 25.89,36.43 "
                                  "32.61,35.03 36,36 C 36,36 37.65,36.54 39,38 C 38.32,38.97 "
                                  "37.35,38.99 36,38.5 C 32.61,37.53 25.89,38.96 22.5,37.5 C "
                                  "19.11,38.96 12.39,37.53 9,38.5 C 7.646,38.99 6.677,38.97 6,38"
                                  " C 7.354,36.06 9,36 9,36 z",
                              drawingParameters: DrawingParameters()),
                          VectorImagePathDefinition(
                              path:
                                  "M 15,32 C 17.5,34.5 27.5,34.5 30,32 C 30.5,30.5 30,30 30,30"
                                  " C 30,27.5 27.5,26 27.5,26 C 33,24.5 33.5,14.5 22.5,10.5 C"
                                  " 11.5,14.5 12,24.5 17.5,26 C 17.5,26 15,27.5 15,30 C 15,30"
                                  " 14.5,30.5 15,32 z",
                              drawingParameters: DrawingParameters()),
                          VectorImagePathDefinition(
                              path:
                                  "M 25 8 A 2.5 2.5 0 1 1  20,8 A 2.5 2.5 0 1 1  25 8 z",
                              drawingParameters: DrawingParameters())
                        ],
                        drawingParameters: DrawingParameters(
                            fillColor: Colors.white,
                            strokeColor: Colors.black,
                            strokeLineCap: StrokeCap.butt)),
                    VectorImagePathDefinition(
                        path:
                            "M 17.5,26 L 27.5,26 M 15,30 L 30,30 M 22.5,15.5 L 22.5,20.5 M 20,18 L 25,18",
                        drawingParameters: DrawingParameters(
                            fillColor: null,
                            strokeColor: Colors.black,
                            strokeLineJoin: StrokeJoin.miter))
                  ],
                  drawingParameters: DrawingParameters(
                      fillColor: null,
                      strokeColor: Colors.black,
                      strokeWidth: 1.5,
                      strokeLineCap: StrokeCap.round,
                      strokeLineJoin: StrokeJoin.round,
                      strokeLineMiterLimit: 4.0))
            ]));
}

class BlackBishop extends BaseVector {
  BlackBishop({Offset position = Offset.zero, double size = 45.0})
      : super(
          drawingZone: position & Size.square(size),
          baseImageSize: 45.0,
          painter: VectorImagePainter(vectorDefinition: <VectorDrawableElement>[
            VectorImageGroup(
                children: <VectorDrawableElement>[
                  VectorImageGroup(
                      children: <VectorDrawableElement>[
                        VectorImagePathDefinition(
                            path:
                                "M 9,36 C 12.39,35.03 19.11,36.43 22.5,34 C 25.89,36.43 32.61,"
                                "35.03 36,36 C 36,36 37.65,36.54 39,38 C 38.32,38.97 37.35,38.99 36,"
                                "38.5 C 32.61,37.53 25.89,38.96 22.5,37.5 C 19.11,38.96 12.39,37.53 9,"
                                "38.5 C 7.646,38.99 6.677,38.97 6,38 C 7.354,36.06 9,36 9,36 z",
                            drawingParameters: DrawingParameters()),
                        VectorImagePathDefinition(
                            path:
                                "M 15,32 C 17.5,34.5 27.5,34.5 30,32 C 30.5,30.5 30,30 30,30 C 30,"
                                "27.5 27.5,26 27.5,26 C 33,24.5 33.5,14.5 22.5,10.5 C 11.5,14.5 12,"
                                "24.5 17.5,26 C 17.5,26 15,27.5 15,30 C 15,30 14.5,30.5 15,32 z",
                            drawingParameters: DrawingParameters()),
                        VectorImagePathDefinition(
                            path:
                                "M 25 8 A 2.5 2.5 0 1 1  20,8 A 2.5 2.5 0 1 1  25 8 z",
                            drawingParameters: DrawingParameters())
                      ],
                      drawingParameters: DrawingParameters(
                          strokeColor: Colors.black,
                          fillColor: Colors.black,
                          strokeLineCap: StrokeCap.butt)),
                  VectorImagePathDefinition(
                      path:
                          "M 17.5,26 L 27.5,26 M 15,30 L 30,30 M 22.5,15.5 L 22.5,20.5"
                          " M 20,18 L 25,18",
                      drawingParameters: DrawingParameters(
                          fillColor: null,
                          strokeColor: Colors.white,
                          strokeLineJoin: StrokeJoin.miter))
                ],
                drawingParameters: DrawingParameters(
                    strokeColor: Colors.black,
                    fillColor: null,
                    strokeWidth: 1.5,
                    strokeLineCap: StrokeCap.round,
                    strokeLineJoin: StrokeJoin.round,
                    strokeLineMiterLimit: 4.0)),
          ]),
        );
}
