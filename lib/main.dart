import 'package:flutter/material.dart';

void main() {
  runApp(
    Column(
      children: const <Widget>[
        Text(
          'Deliver features faster',
          textDirection: TextDirection.ltr,
        ),
        Text(
          'Craft beautiful UIs',
          textDirection: TextDirection.ltr,
        ),
        Expanded(
          child: FittedBox(
            fit: BoxFit.contain, // otherwise the logo will be tiny
            child: FlutterLogo(),
          ),
        ),
      ],
    ),
  );
}
