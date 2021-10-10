import 'package:flutter/material.dart';

abstract class DefaultGradient {
  static LinearGradient linear(context) {
    return LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      tileMode: TileMode.mirror,
      colors: [
        Theme.of(context).primaryColorDark,
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColorLight,
      ],
    );
  }

  static RadialGradient radial(context) {
    return RadialGradient(
      center: Alignment.topRight,
      focal: Alignment.topCenter,
      focalRadius: 15,
      colors: [
        Theme.of(context).primaryColorDark,
        Theme.of(context).primaryColor,
        Theme.of(context).primaryColorLight,
      ],
    );
  }
}
