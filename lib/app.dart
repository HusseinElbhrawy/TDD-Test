import 'package:flutter/material.dart';
import 'package:flutter_tdd_testing/presentation/post_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostScreen(),
    );
  }
}
