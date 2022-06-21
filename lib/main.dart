import 'package:debouncer/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          centerTitle: true
        )
      ),
      title: 'Debouncer',
      home: Home()
    );
  }
}