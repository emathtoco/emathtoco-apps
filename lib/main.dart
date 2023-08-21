import 'package:aplikasi_ta/cobarealtime.dart';
import 'package:aplikasi_ta/features/auth/presentation/landing_page.dart';
import 'package:aplikasi_ta/features/auth/presentation/login.dart';
import 'package:aplikasi_ta/features/inventory/presentation/addtask.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: landing_page(),
    );
  }
}
