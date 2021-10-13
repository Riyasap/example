import 'package:flutter/material.dart';

class DropShadow extends BoxShadow{
  DropShadow({
    Color color = const Color(0xFF000000),
    Offset offset = Offset.zero,
    double blurRadius = 0.0,
}) : super(color: color, offset: offset, blurRadius: blurRadius);

  @override
  BoxShadow scale(double factor)  {
    return BoxShadow(
      color: color,
      offset: offset * factor,
      blurRadius: blurRadius * factor,
      spreadRadius: spreadRadius * factor,
    );
  }
}
