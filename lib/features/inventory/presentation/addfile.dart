import 'package:aplikasi_ta/core/widget/loading_dialog.dart';
import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:aplikasi_ta/features/inventory/presentation/addtask.dart';
import 'package:aplikasi_ta/features/inventory/presentation/filedetail.dart';
import 'package:aplikasi_ta/features/inventory/presentation/widget/anscard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class addfile extends StatefulWidget {
  addfile({super.key});

  @override
  State<addfile> createState() => _addfileState();
}

class _addfileState extends State<addfile> {
  Inventory? inventory;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            setState(() {});
          },
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 48,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.upload_file),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Upload Task',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Upload Amount',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                // RefreshIndicator(
                //   onRefresh: () async {
                //     setState(() {});
                //   },
                // child:
                Expanded(
                  child: Container(
                      color: Colors.white,
                      child: FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                        future: FirebaseFirestore.instance
                            .collection('user')
                            .doc(FirebaseAuth.instance.currentUser!.uid)
                            .collection('inventory')
                            .orderBy('soal')
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final inventories =
                                snapshot.data!.docs.map((inventory) {
                              return Inventory.fromQuerySnapshot(inventory);
                            }).toList();
                            return ListView.builder(
                              itemCount: inventories.length,
                              padding: EdgeInsets.only(bottom: 128),
                              itemBuilder: (context, index) {
                                return anscard(
                                  inventory: inventories[index],
                                  docId: snapshot.data!.docs[index].id,
                                );
                              },
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )),
                ),
                // ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: ElevatedButton(
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
                            builder: (context) => addtask(),
                          ));
                    },
                    child: Stack(
                      children: [
                        Text(
                          'ADD FILE',
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
                          'ADD FILE',
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
            ),
          ]),
        ));
  }
}
