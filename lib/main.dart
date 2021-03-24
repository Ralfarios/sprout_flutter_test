import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './core/app.dart';

void main() {
  runApp(SproutContactApp());
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
    ),
  );
}
