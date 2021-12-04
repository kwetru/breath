import 'package:flutter/material.dart';
import 'package:breath/src/pages/home.dart';
import 'package:breath/src/pages/duration_screen.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.cyan,
    ),
    home: Home(),
    //initialRoute: '/',
    //routes: {
    //  '/': (context) => const Home(),
    //  '/two': (context) => const Durationscreen(mode: 1),
    //},
  ));
}
