import 'package:aplikasi_ta/features/auth/presentation/next_landing.dart';
import 'package:flutter/material.dart';

class landing_page extends StatefulWidget {
  landing_page({super.key});

  @override
  State<landing_page> createState() => _landing_pageState();
}

class _landing_pageState extends State<landing_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        SizedBox(
          height: 130,
        ),
        Image.asset(
          'assets/images/study.png',
          height: 275,
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Apasih',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Image.asset(
                'assets/images/EMATH TOCO2.png',
                height: 22,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                '?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Center(
          child: Container(
            width: 271,
            height: 72,
            child: Center(
              child: Text(
                'Aplikasi Pengoreksi Esai Otomatis yang akan mempermudah pengoreksian esai kamu',
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
                  minimumSize: Size(190, 48),
                  backgroundColor: Color(0xFF4481EB),
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
                        builder: (context) => next_landing(),
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
