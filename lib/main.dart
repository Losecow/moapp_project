import 'package:flutter/material.dart';
import 'login_page.dart'; // ResponsiveLoginPage가 있는 파일

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Match',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
        useMaterial3: true,
      ),
      // const 키워드를 제거하여 오류 해결
      home: const ResponsiveLoginPage(),
    );
  }
}