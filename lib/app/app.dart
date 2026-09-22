import 'package:flutter/material.dart';
import '../features/auth/presentation/auth_gate.dart';

class MedmylifeApp extends StatelessWidget {
  const MedmylifeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedMyLife',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
        useMaterial3: true,
      ),
      home: const AuthGate(),
    );
  }
}