import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void drawImage({Canvas canvas, Size size, ui.Image image, Offset offset = const Offset(0.0, 0.0)}) {
  canvas.drawImage(image, offset, Paint());
}