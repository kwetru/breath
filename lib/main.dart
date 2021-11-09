import 'package:breath/src/timer/one_minute.dart';
import 'package:breath/src/settings_screen.dart';
import 'package:breath/src/timer/three_minute.dart';
import 'package:flutter/material.dart';
import 'package:breath/src/home.dart';
import 'package:breath/src/two_screen.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.cyan,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/two': (context) => Twoscreen(),
    '/settings': (context) => Settingsscreen(),
    '/one_minute': (context) => MyApp(),
    '/three_minute': (context) => Ill()
  },
));






