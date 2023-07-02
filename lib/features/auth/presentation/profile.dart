// ignore_for_file: camel_case_types, use_build_context_synchronously

import 'package:aplikasi_ta/features/auth/data/auth_service.dart';
import 'package:flutter/material.dart';

class profile extends StatelessWidget {
   profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon:  Icon(Icons.close_rounded),
            color:  Color(0xFF66080A),
          ),
          iconTheme:  IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                child:  Center(
                  child: Text(
                        'MA',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      ),
                ),
              ),
               SizedBox(
                height: 10,
              ),
               Text(
                'email@gmail.com',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
               SizedBox(
                height: 60,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize:  Size(250, 48),
                    backgroundColor:  Color(0xFF66080A),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                        side:  BorderSide(
                          color: Colors.black,
                          width: 2,
                        )),
                  ),
                  onPressed: () async{
                    await AuthService.logOut();
                    Navigator.pop(context);
                  },
                  child: Stack(
                    children: [
                      Text(
                        'LOGOUT',
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
                        'LOGOUT',
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
        ));
  }
}
