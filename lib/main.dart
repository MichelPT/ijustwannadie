import 'package:compute_engine_app/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ComputeEngineApp());
}

class ComputeEngineApp extends StatelessWidget {
  const ComputeEngineApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Michel Nyoba Cloud Computing Web',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(),
    );
  }
}
