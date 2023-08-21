import 'dart:math';

import 'package:aplikasi_ta/features/auth/presentation/login.dart';
import 'package:aplikasi_ta/features/inventory/presentation/home.dart';
import 'package:aplikasi_ta/wrapper.dart';
import 'package:flutter/material.dart';

class next_landing extends StatefulWidget {
  next_landing({super.key});

  @override
  State<next_landing> createState() => _next_landingState();
}

class _next_landingState extends State<next_landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 155,
        ),
        Image.asset(
          'assets/images/work.png',
          height: 250,
          // fit: BoxFit.cover,
        ),
        SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/EMATH TOCO2.png',
          height: 24,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          // ignore: sized_box_for_whitespace
          child: Container(
            width: 165,
            height: 72,
            child: Center(
              child: Text(
                'Mudah digunakan Mudah dioperasikan Mudah dimengerti',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 151,
        ),
        Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4481EB),
                  minimumSize: Size(190, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side: BorderSide(
                        color: Colors.black,
                        width: 2,
                      )),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => wrapper(),
                      ));
                },
                child: Stack(
                  children: [
                    Text(
                      'NEXT',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                      ),
                    ),
                    Text(
                      'NEXT',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ],
    ));
  }
}
