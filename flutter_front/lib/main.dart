import 'package:flutter/material.dart';
import 'package:flutter_front/views/deleteUser_page.dart';
import 'package:flutter_front/views/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DeleteUser(),
    );
  }
}
