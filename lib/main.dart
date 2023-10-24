import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mirai/mirai.dart';

void main() async {
  await Mirai.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Server Side UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  dynamic jsonData;
  @override
  void initState() {
    super.initState();
    loadIntroScreenJson();
  }

  Future<void> loadIntroScreenJson() async {
    final jsonStr = await rootBundle.loadString('assets/form_screen.json');
    setState(() {
      jsonData = jsonDecode(jsonStr);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Mirai.fromJson(jsonData, context) ??
        const Center(
          child: CircularProgressIndicator(),
        );
  }
}
