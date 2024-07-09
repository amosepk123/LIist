
import 'package:flutter/material.dart';
import 'package:list/List.dart';
import 'package:list/List_main_page.dart';

import 'ThreeParameter_listView.dart';
import 'original.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const sample21(),
    );
  }
}
