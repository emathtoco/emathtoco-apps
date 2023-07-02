// ignore_for_file: unused_import, body_might_complete_normally_nullable, unused_local_variable, unused_catch_clause, camel_case_types, use_build_context_synchronously

import 'package:aplikasi_ta/features/auth/data/auth_service.dart';
import 'package:aplikasi_ta/features/inventory/presentation/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
   login({
    super.key,
  });
  // final TextEditingController controller;

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var obscurePassword = true;

  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;

  late TextEditingController _emailregcontroller;
  late TextEditingController _passwordregcontroller;

  final _keylogem = GlobalKey<FormState>();
  final _keylogpas = GlobalKey<FormState>();
  final _keyregem = GlobalKey<FormState>();
  final _keyregpas = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailregcontroller = TextEditingController();
    _passwordregcontroller = TextEditingController();
    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
    _emailregcontroller.dispose();
    _passwordregcontroller.dispose();
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(0),
              child: Image.asset(
                'assets/images/Fig1.png',
                width: 635.98,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(20, 267, 0, 0),
              child: Text(
                'Login',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(20, 301, 0, 0),
              child: Text(
                'Email',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Form(
              key: _keylogem,
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.fromLTRB(20, 327, 20, 0),
                    child: ClipRRect(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                                content: Center(
                              child: Text(
                                'Emailnya Masih Kosong Nih',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            )));
                          }
                        },
                        controller: _emailcontroller,
                        decoration: InputDecoration(
                          hintText: 'username@gmail.com',
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.5),
                          contentPadding:
                               EdgeInsets.symmetric(horizontal: 10.0),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:  BorderSide(width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:  BorderSide(
                              width: 2.0,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:  BorderSide(
                              width: 2.0,
                              color: Colors.red,
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide:  BorderSide(
                              width: 2.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(20, 380, 0, 0),
              child: Text(
                'Password',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Form(
                key: _keylogpas,
                child: Column(
                  children: [
                    Padding(
                      padding:  EdgeInsets.fromLTRB(20, 406, 20, 0),
                      child: ClipRRect(
                        child: TextFormField(
                          controller: _passwordcontroller,
                          obscureText: obscurePassword,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscurePassword = !obscurePassword;
                                  });
                                },
                                icon: obscurePassword
                                    ?  Icon(Icons.visibility_off)
                                    :  Icon(Icons.visibility_rounded)),
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white.withOpacity(0.5),
                            contentPadding:
                                 EdgeInsets.symmetric(horizontal: 10.0),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:  BorderSide(width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:  BorderSide(
                                width: 2.0,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:  BorderSide(
                                width: 2.0,
                                color: Colors.red,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide:  BorderSide(
                                width: 2.0,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            Align(
              alignment:  AlignmentDirectional(-1, 1),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/Fig2.png',
                  width: 490.07,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment:  AlignmentDirectional(0, -1),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(0, 692, 0, 60),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize:  Size(190, 48),
                      backgroundColor:  Color(0xFF009933),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side:  BorderSide(
                            color: Colors.black,
                            width: 2,
                          )),
                    ),
                    onPressed: () async {
                      if (_keylogem.currentState!.validate() ||
                          _keylogpas.currentState!.validate()) {
                        try {
                          final result = await AuthService.login(
                              _emailcontroller.text, _passwordcontroller.text);
                        } on FirebaseAuthException catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content: Center(
                            child: Text(
                              'Email sama Passwordnya Salah Nih',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )));
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                              content: Center(
                            child: Text(
                              'Error Nih Coba Register Ulang Ya',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          )));
                        }
                      }
                    },
                    child: Stack(
                      children: [
                        Text(
                          'MASUK',
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
                          'MASUK',
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
             Padding(
              padding: EdgeInsets.fromLTRB(85, 755, 0, 0),
              child: Text(
                'New to',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(143, 756, 0, 0),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/EMATH TOCO.png',
                  width: 98,
                  height: 22,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.fromLTRB(242, 755, 0, 0),
              child: Text(
                '?',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
            ),
            Padding(
              padding:  EdgeInsets.fromLTRB(247, 742, 0, 0),
              child: TextButton(
                onPressed: () {
                  showGeneralDialog(
                    barrierDismissible: true,
                    barrierLabel: '',
                    barrierColor:  Color(0xFFFFFFFF).withOpacity(0.75),
                    transitionDuration:  Duration(milliseconds: 300),
                    context: context,
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return Align(
                        alignment: Alignment.center,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin:  Offset(0, 1),
                            end: Offset.zero,
                          ).animate(animation),
                          child: AlertDialog(
                            scrollable: true,
                            contentPadding:  EdgeInsets.fromLTRB(0, 20, 0, 0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side:  BorderSide(width: 2, color: Colors.black),
                            ),
                            content: SizedBox(
                              height: 600,
                              width: 300,
                              child: Form(
                                child: Column(
                                  children: <Widget>[
                                    Stack(
                                      children: [
                                        Padding(
                                          padding:  EdgeInsets.only(top: 200),
                                          child: Image.asset(
                                            'assets/images/Fig3.png',
                                            width: 490.07,
                                            height: 400,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                               EdgeInsets.fromLTRB(240, 0, 0, 0),
                                          child: Column(
                                            children: [
                                              IconButton(
                                                icon:  Icon(Icons.close_rounded),
                                                iconSize: 35,
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                color:  Color(0xFF66080A),
                                              )
                                            ],
                                          ),
                                        ),
                                         Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 189, 20, 367),
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                         Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 223, 20, 356),
                                          child: Text(
                                            'Email',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Form(
                                            key: _keyregem,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(
                                                      20, 249, 20, 303),
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                 SnackBar(
                                                                    content:
                                                                        Center(
                                                          child: Text(
                                                            'Emailnya Masih Kosong Nih',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )));
                                                      }
                                                    },
                                                    controller:
                                                        _emailregcontroller,
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'username@gmail.com',
                                                      filled: true,
                                                      fillColor: Colors.white
                                                          .withOpacity(0.5),
                                                      contentPadding:
                                                           EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:  BorderSide(
                                                            width: 2),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                         Padding(
                                          padding: EdgeInsets.fromLTRB(
                                              20, 302, 20, 227),
                                          child: Text(
                                            'Password',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.normal,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Form(
                                            key: _keyregpas,
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:  EdgeInsets.fromLTRB(
                                                      20, 328, 20, 224),
                                                  child: TextFormField(
                                                    validator: (value) {
                                                      if (value!.isEmpty) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                                 SnackBar(
                                                                    content:
                                                                        Center(
                                                          child: Text(
                                                            'Passwordnya Masih Kosong Nih',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        )));
                                                      }
                                                    },
                                                    controller:
                                                        _passwordregcontroller,
                                                    decoration: InputDecoration(
                                                      hintText: 'Password',
                                                      filled: true,
                                                      fillColor: Colors.white
                                                          .withOpacity(0.5),
                                                      contentPadding:
                                                           EdgeInsets.symmetric(
                                                              horizontal: 10.0),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide:  BorderSide(
                                                            width: 2),
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        borderSide:  BorderSide(
                                                          width: 2.0,
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )),
                                        Padding(
                                          padding:  EdgeInsets.fromLTRB(
                                              55, 532, 55, 20),
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                minimumSize:  Size(190, 48),
                                                backgroundColor:
                                                     Color(0xFF009933),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    side:  BorderSide(
                                                      color: Colors.black,
                                                      width: 2,
                                                    )),
                                              ),
                                              onPressed: () async {
                                                if (_keyregem.currentState!
                                                        .validate() ||
                                                    _keyregpas.currentState!
                                                        .validate()) {
                                                  try {
                                                    final result =
                                                        await AuthService.register(
                                                            _emailregcontroller
                                                                .text,
                                                            _passwordregcontroller
                                                                .text);
                                                    _emailregcontroller.text =
                                                        '';
                                                    _passwordregcontroller
                                                        .text = '';
                                                    Navigator.of(context).pop();
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar( SnackBar(
                                                            content: Center(
                                                      child: Text(
                                                        'Asik Udah ke Register Nih Akunnya',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xFF009933),
                                                        ),
                                                      ),
                                                    )));
                                                  } on FirebaseAuthException catch (e) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar( SnackBar(
                                                            content: Center(
                                                      child: Text(
                                                        'Yah Masukin Emailnya yang bener dong',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )));
                                                  } catch (e) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar( SnackBar(
                                                            content: Center(
                                                      child: Text(
                                                        'Error Nih Coba Register Ulang Ya',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    )));
                                                  }
                                                }
                                              },
                                              child: Stack(
                                                children: [
                                                  Text(
                                                    'REGISTER',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      foreground: Paint()
                                                        ..style =
                                                            PaintingStyle.stroke
                                                        ..strokeWidth = 2
                                                        ..color = Colors.black,
                                                    ),
                                                  ),
                                                   Text(
                                                    'REGISTER',
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
                child:  Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: Color(0xFF0084BC),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
