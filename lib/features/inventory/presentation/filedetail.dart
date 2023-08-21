import 'package:aplikasi_ta/features/inventory/data/inventoryservice.dart';
import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:aplikasi_ta/features/inventory/presentation/addtask.dart';
import 'package:aplikasi_ta/features/inventory/presentation/full_image_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class filedetail extends StatefulWidget {
  filedetail({super.key, required this.docId});

  final String docId;

  @override
  State<filedetail> createState() => _filedetailState();
}

class _filedetailState extends State<filedetail> {
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
        child: Stack(
          children: [
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
                      Icon(Icons.book),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'File',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () async {
                            final result =
                                await inventoryservice.deleteInventory(
                                    FirebaseAuth.instance.currentUser!,
                                    widget.docId);

                            if (result) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Center(
                                child: Text(
                                  'Jawaban Kamu Sudah Terhapus :)',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF009933),
                                  ),
                                ),
                              )));
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Center(
                                child: Text(
                                  'Hapus Jawaban Gagal Terupload Silahkan Coba Lagi',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Color(0xFF66080A),
                                  ),
                                ),
                              )));
                            }
                          },
                          icon: Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => addtask(
                                    inventory: inventory,
                                    docId: widget.docId,
                                  ),
                                ));
                          },
                          icon: Icon(Icons.edit)),
                    ],
                  ),
                ),
                FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  future: FirebaseFirestore.instance
                      .collection('user')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('inventory')
                      .doc(widget.docId)
                      .get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      inventory =
                          Inventory.fromDocumentSnapshot(snapshot.data!);

                      return Expanded(
                        child: Container(
                          color: Colors.white,
                          child: ListView(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: _dataitem('Nama', inventory!.nama)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: _dataitem('NIM', inventory!.nim)),
                              ),
                              Row(
                                children: [
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                        vertical: 20,
                                      ),
                                      child: Container(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border(
                                              right: BorderSide(
                                                color: Colors.black,
                                                width: 2.0,
                                              ),
                                            ),
                                          ),
                                          child: _dataitem(
                                              'Kelas', inventory!.kelas)),
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
                                      child:
                                          _dataitem('No Soal', inventory!.soal),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child: _dataitem(
                                        'Mata Kuliah', inventory!.matkul)),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 20,
                                ),
                                child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                      ),
                                    ),
                                    child:
                                        _dataitem('Nilai', inventory!.nilai)),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 20),
                                child: Text(
                                  'Jawaban',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  if (inventory!.imageUrl.isEmpty)
                                    Container(
                                      height: 300,
                                      width: double.infinity,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 60),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 2.0,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Icon(
                                        Icons.add_photo_alternate_outlined,
                                        size: 100,
                                      ),
                                    )
                                  else
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return FullImageScreen(
                                                imageUrl: inventory!.imageUrl);
                                          },
                                        ));
                                      },
                                      child: Container(
                                          height: 300,
                                          width: double.infinity,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 60),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.black,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Image.network(
                                            inventory!.imageUrl,
                                            height: 300,
                                          )),
                                    ),
                                ],
                              ),
                              Column(
                                children: [
                                  _dataitem(
                                    '',
                                    DateFormat('dd/MM/yyyy HH:mm').format(
                                        DateTime.parse(inventory!.updatedAt)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _dataitem(String title, String data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Text(
        data,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      )
    ],
  );
}
