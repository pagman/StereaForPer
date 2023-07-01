import 'dart:ui';

import 'package:flutter/material.dart';

import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    scrollBehavior: MaterialScrollBehavior().copyWith(
    dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown}
    ),
    initialRoute: '/',
    routes: {
    // When navigating to the "/" route, build the FirstScreen widget.
    '/': (context) => const HomePage(),
    // When navigating to the "/second" route, build the SecondScreen widget.

    }
    );
  }
}

