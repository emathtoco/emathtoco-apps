import 'package:aplikasi_ta/features/inventory/presentation/addfile.dart';
import 'package:aplikasi_ta/features/inventory/presentation/widget/drawer.dart';
import 'package:flutter/material.dart';

class classdetails extends StatelessWidget {
  classdetails({super.key});

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
        backgroundColor: Color(0xFFF6A9FD0),
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
      // drawer: drawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            width: double.infinity,
            height: 125,
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
                  radius: 36,
                  child: CircleAvatar(
                    radius: 33,
                    backgroundImage: AssetImage('assets/images/Telu.jpeg'),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Koding Kompresi',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Flexible(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            'Gelar Budiman',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              'Tugas',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: Colors.white,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => addfile(),
                        ));
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Colors.black,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.book),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Upload Tugas',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ))
        ],
      ),
    );
  }
}
