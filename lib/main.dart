import 'package:breath/src/pages/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:breath/src/pages/home.dart';
import 'package:breath/src/pages/duration_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';



void main() => runApp(MaterialApp(
  theme: ThemeData(
    primaryColor: Colors.cyan,
  ),
  initialRoute: '/',
  routes: {
    '/': (context) => const Home(),
    '/two': (context) => const Durationscreen(),
    '/settings': (context) => const Settingsscreen(),
  },
));






