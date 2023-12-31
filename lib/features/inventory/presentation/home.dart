import 'package:aplikasi_ta/features/auth/presentation/profile.dart';
import 'package:aplikasi_ta/features/inventory/presentation/classdetails.dart';
import 'package:aplikasi_ta/features/inventory/presentation/widget/drawer.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  home({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Color(0xFFFFFFFF).withOpacity(0.75),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Image.asset(
          'assets/images/EMATH TOCO2.png',
          width: 111.36,
          height: 25,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profile(),
                  ));
            },
            icon: Stack(
              alignment: Alignment.topRight,
              children: [
                Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,
                  // semanticLabel: 'Person',
                ),
                Icon(
                  Icons.person_outline,
                  size: 30,
                  color: Colors.black,
                  // semanticLabel: 'Person',
                ),
              ],
            ),
          )
        ],
        backgroundColor: Color(0xFF6A9FD0),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), // Atur sesuai keinginan Anda
              bottomRight: Radius.circular(25), // Atur sesuai keinginan Anda
            ),
            side: BorderSide(
              color: Colors.black,
              width: 2,
            )),
      ),
      drawer: drawer(),
      body: ListView(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => classdetails()));
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              margin: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 20,
              ),
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF6AC4D0),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black, // Warna outline
                  width: 2, // Lebar outline
                ),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 49,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage(
                        'assets/images/Telu.jpeg',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Koding Kompresi',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Container(
                              height: 2,
                              width: double.infinity,
                              color: Colors.black, // Warna garis tengah
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Gelar Budiman',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
