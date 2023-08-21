import 'package:aplikasi_ta/features/inventory/presentation/classdetails.dart';
import 'package:aplikasi_ta/features/inventory/presentation/home.dart';
import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AppBar(
            iconTheme: IconThemeData(color: Colors.black),
            title: Image.asset(
              'assets/images/EMATH TOCO2.png',
              width: 111.36,
              height: 25,
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Stack(
                  alignment: Alignment.topRight,
                  children: [
                    IconButton(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      icon: Icon(Icons.close_rounded),
                      iconSize: 30,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: Color(0xFF66080A),
                    )
                  ],
                ),
              )
            ],
            backgroundColor: Color(0xFF6A9FD0),
            shape: ContinuousRectangleBorder(
                side: BorderSide(
              color: Colors.black,
              width: 2,
            )),
          ),
          Wrap(
            runSpacing: 0,
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                },
                leading: Icon(
                  Icons.home_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text('Home'),
              ),
              // ListTile(
              //   leading: Icon(
              //     Icons.calendar_today_outlined,
              //     color: Colors.black,
              //     size: 30,
              //   ),
              //   title: Text('Calendar'),
              // ),
              Divider(
                color: Colors.black,
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => classdetails(),
                      ));
                },
                leading: Icon(
                  Icons.book,
                  color: Colors.black,
                  size: 30,
                ),
                title: Text('Koding Kompresi'),
              ),
            ],
          ),
          SizedBox(height: 200,),
          Expanded(
            child: 
            Image.asset(
              'assets/images/Fig 22.png',
              width: 490.07,
              height: 400,
              fit: BoxFit.cover,
            ),
          )
        ],
      ),
    );
  }
}
