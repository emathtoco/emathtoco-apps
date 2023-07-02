// ignore_for_file: camel_case_types

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
          height: 130,
        ),
        Image.asset(
          'assets/images/learn.png',
          height: 275,
        ),
         SizedBox(
          height: 20,
        ),
        Image.asset(
          'assets/images/EMATH TOCO.png',
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
            child:  Center(
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
        SizedBox(
          height: 48,
          width: 190,
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 112),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color(0xFF009933),
                  minimumSize:  Size(190, 48),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                      side:  BorderSide(
                        color: Colors.black,
                        width: 2,
                      )),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  wrapper(),
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
          ),
        )
      ],
    ));
  }
}
