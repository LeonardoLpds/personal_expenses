import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline3!
          .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    );
  }
}
