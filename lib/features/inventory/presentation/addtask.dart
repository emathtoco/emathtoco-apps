import 'dart:io';
import 'package:aplikasi_ta/core/widget/loading_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart' as p;
import 'package:aplikasi_ta/features/inventory/data/firebase_storage_service.dart';
import 'package:aplikasi_ta/features/inventory/data/image_picker_handler.dart';
import 'package:aplikasi_ta/features/inventory/data/inventoryservice.dart';
import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class addtask extends StatefulWidget {
  addtask({super.key, this.inventory, this.docId});

  Inventory? inventory;
  String? docId;

  @override
  State<addtask> createState() => _addtaskState();
}

class _addtaskState extends State<addtask> {
  late TextEditingController _namacontroller;
  late TextEditingController _nimcontroller;
  late TextEditingController _kelascontroller;
  late TextEditingController _soalcontroller;
  late TextEditingController _matkulcontroller;

  File? pickedImage;

  @override
  void initState() {
    super.initState();
    var nama = '';
    var nim = '';
    var kelas = '';
    var no = '';
    var matkul = '';

    if (widget.inventory != null) {
      nama = widget.inventory!.nama;
      nim = widget.inventory!.nim;
      kelas = widget.inventory!.kelas;
      no = widget.inventory!.soal;
      matkul = widget.inventory!.matkul;
    }

    _namacontroller = TextEditingController(text: nama);
    _nimcontroller = TextEditingController(text: nim);
    _kelascontroller = TextEditingController(text: kelas);
    _soalcontroller = TextEditingController(text: no);
    _matkulcontroller = TextEditingController(text: matkul);
  }

  @override
  void dispose() {
    _namacontroller.dispose();
    _nimcontroller.dispose();
    _kelascontroller.dispose();
    _soalcontroller.dispose();
    _matkulcontroller.dispose();
    super.dispose();
  }

  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.close_rounded),
          color: Color(0xFF66080A),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Column(
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
                      'File Upload',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _key,
                child: Expanded(
                  child: Container(
                    color: Colors.white,
                    child: ListView(
                      padding: EdgeInsets.only(bottom: 128),
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child:
                              _dataitem(_namacontroller, 'Nama', 'Input Name'),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 10,
                          ),
                          child: _dataitem(_nimcontroller, 'NIM', '110119xxxx'),
                        ),
                        Row(
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: _dataitem(
                                    _kelascontroller, 'Kelas', 'ex: TT 43 G1'),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                ),
                                child: _dataitem(
                                    _soalcontroller, 'No Soal', 'ex: 1'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: _dataitem(_matkulcontroller, 'Mata kuliah',
                              'ex: Koding Kompresi'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Text(
                            'Jawaban',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        pickedImage != null
                            ? Stack(
                                children: [
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
                                      child: Stack(
                                        children: [
                                          Positioned.fill(
                                            child: Image.file(
                                              pickedImage!,
                                              height: 300,
                                            ),
                                          ),
                                          Positioned(
                                            bottom: 10,
                                            right: 10,
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size(95, 38),
                                                  backgroundColor:
                                                      Color(0xFF4481EB),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: BorderSide(
                                                        color: Colors.black,
                                                        width: 2,
                                                      )),
                                                ),
                                                onPressed: () async {
                                                  _pickImage();
                                                },
                                                child: Stack(
                                                  children: [
                                                    Text(
                                                      'Edit Photo',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        foreground: Paint()
                                                          ..style =
                                                              PaintingStyle
                                                                  .stroke
                                                          ..strokeWidth = 2
                                                          ..color =
                                                              Colors.black,
                                                      ),
                                                    ),
                                                    Text(
                                                      'Edit Photo',
                                                      style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 14,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                )),
                                          ),
                                        ],
                                      )),
                                ],
                              )
                            : widget.inventory != null
                                ? widget.inventory!.imageUrl == ''
                                    ? _containerAddImage()
                                    : Stack(
                                        children: [
                                          Container(
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
                                              child: Stack(
                                                children: [
                                                  Positioned.fill(
                                                    child: Image.network(
                                                      widget
                                                          .inventory!.imageUrl,
                                                      height: 300,
                                                    ),
                                                  ),
                                                  Positioned(
                                                    bottom: 10,
                                                    right: 10,
                                                    child: ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          minimumSize:
                                                              Size(95, 38),
                                                          backgroundColor:
                                                              Color(0xFF4481EB),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  side:
                                                                      BorderSide(
                                                                    color: Colors
                                                                        .black,
                                                                    width: 2,
                                                                  )),
                                                        ),
                                                        onPressed: () async {
                                                          _pickImage();
                                                        },
                                                        child: Stack(
                                                          children: [
                                                            Text(
                                                              'Edit Photo',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14,
                                                                foreground:
                                                                    Paint()
                                                                      ..style =
                                                                          PaintingStyle
                                                                              .stroke
                                                                      ..strokeWidth =
                                                                          2
                                                                      ..color =
                                                                          Colors
                                                                              .black,
                                                              ),
                                                            ),
                                                            Text(
                                                              'Edit Photo',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ],
                                              )),
                                        ],
                                      )
                                : _containerAddImage(),
                      ],
                    ),
                  ),
                ),
              ),
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
                  onPressed: () async {
                    // String extension = p.extension(pickedImage!.path);
                    String newFileName =
                        '${_soalcontroller.text}_${_nimcontroller.text}_';
                    if (_key.currentState!.validate()) {
                      LoadingDialog.showLoadingDialog(context);
                      if (widget.inventory != null) {
                        String imageUrl = '';
                        if (pickedImage != null) {
                          imageUrl = await FirebaseStorageService.uploadImage(
                              newFileName, pickedImage!.path);
                        }
                        final result = await inventoryservice.editInventory(
                            FirebaseAuth.instance.currentUser!,
                            Inventory(
                              nama: _namacontroller.text,
                              nim: _nimcontroller.text,
                              kelas: _kelascontroller.text,
                              soal: _soalcontroller.text,
                              matkul: _matkulcontroller.text,
                              imageUrl: imageUrl,
                              updatedAt: DateTime.now().toIso8601String(),
                              nilai: '',
                            ),
                            widget.docId!);

                        if (result) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(
                              'Jawaban Kamu Sudah Teganti :)',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF009933),
                              ),
                            ),
                          )));
                          Navigator.pop(context);
                          //await inventoryservice.copyFirestoreToRealtimeDB(FirebaseAuth.instance.currentUser!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(
                              'Jawaban Gagal Terganti Silahkan Coba Lagi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF66080A),
                              ),
                            ),
                          )));
                        }
                      } else {
                        String imageUrl = '';
                        if (pickedImage != null) {
                          imageUrl = await FirebaseStorageService.uploadImage(
                              newFileName, pickedImage!.path);
                        }

                        final result = await inventoryservice.addInventory(
                            FirebaseAuth.instance.currentUser!,
                            Inventory(
                              nama: _namacontroller.text,
                              nim: _nimcontroller.text,
                              kelas: _kelascontroller.text,
                              soal: _soalcontroller.text,
                              matkul: _matkulcontroller.text,
                              imageUrl: imageUrl,
                              updatedAt: DateTime.now().toIso8601String(),
                              nilai: '',
                            ));

                        if (result) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(
                              'Jawaban Kamu Sudah Terupload :)',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF009933),
                              ),
                            ),
                          )));
                          Navigator.pop(context);
                          //await inventoryservice.copyFirestoreToRealtimeDB(FirebaseAuth.instance.currentUser!);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Center(
                            child: Text(
                              'Jawaban Gagal Terupload Silahkan Coba Lagi',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Color(0xFF66080A),
                              ),
                            ),
                          )));
                        }
                      }
                      LoadingDialog.dismissLoadingDialog(context);
                    }
                  },
                  child: Stack(
                    children: [
                      Text(
                        'UPLOAD',
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
                        'UPLOAD',
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
        ],
      ),
    );
  }

  Widget _dataitem(
      TextEditingController controller, String title, String data) {
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
        TextFormField(
          controller: controller,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: data,
            hintStyle: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            filled: true,
            fillColor: Colors.white.withOpacity(0.5),
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(
                width: 2.0,
              ),
            ),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Masih Ada Tempat Yang Kosong Nih';
            }
          },
        )
      ],
    );
  }

  void _pickImage() async {
    final imagePicker = ImagePickerHandler();
    pickedImage = await imagePicker.pickImage();
    setState(() {});
  }

  Widget _containerAddImage() {
    return GestureDetector(
      onTap: () async {
        _pickImage();
      },
      child: Container(
          height: 300,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 60),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_photo_alternate_outlined,
                size: 100,
              ),
              Text(
                'No Items',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              )
            ],
          )),
    );
  }
}
