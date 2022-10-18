import 'package:flutter/material.dart';
import 'package:yongyang/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YongYang',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Color(0xAAE3DCD2),
        scaffoldBackgroundColor: Color(0xAA013328),
      ),
      home: const Homepage(),
    );
  }
}
