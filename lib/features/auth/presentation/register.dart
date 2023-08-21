import 'package:aplikasi_ta/core/widget/loading_dialog.dart';
import 'package:aplikasi_ta/features/auth/data/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var obscurePassword = true;

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  final _keyregem = GlobalKey<FormState>();
  final _keyregpas = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: EdgeInsets.fromLTRB(0, 20, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 2, color: Colors.black),
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
                    padding: EdgeInsets.only(top: 200),
                    child: Image.asset(
                      'assets/images/Fig 33.png',
                      width: 490.07,
                      height: 400,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.close_rounded),
                            iconSize: 35,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            color: Color(0xFF66080A),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        Text(
                          'Register',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Email',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Form(
                            key: _keyregem,
                            child: Column(
                              children: [
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
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
                                  controller: _emailController,
                                  decoration: InputDecoration(
                                    hintText: 'username@gmail.com',
                                    filled: true,
                                    fillColor: Colors.white.withOpacity(0.5),
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10.0),
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
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: Colors.red,
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: BorderSide(
                                        width: 2.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(height: 5,),
                        Text(
                          'Password',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Form(
                            key: _keyregpas,
                            child: Column(
                              children: [
                                ClipRRect(
                                  child: TextFormField(
                                    controller: _passwordController,
                                    obscureText: obscurePassword,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              obscurePassword =
                                                  !obscurePassword;
                                            });
                                          },
                                          icon: obscurePassword
                                              ? Icon(Icons.visibility_off)
                                              : Icon(Icons.visibility_rounded)),
                                      hintText: 'Password',
                                      filled: true,
                                      fillColor: Colors.white.withOpacity(0.5),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 2),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          width: 2.0,
                                        ),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          width: 2.0,
                                          color: Colors.red,
                                        ),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        borderSide: BorderSide(
                                          width: 2.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Center(
                                          child: Text(
                                            'Passwordnya Masih Kosong Nih',
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
                                  ),
                                ),
                              ],
                            )),
                            SizedBox(height: 150,),
                        Center(
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
                                if (_keyregem.currentState!.validate() ||
                                    _keyregpas.currentState!.validate()) {
                                  LoadingDialog.showLoadingDialog(context);
                                  try {
                                    final result = await AuthService.register(
                                        _emailController.text,
                                        _passwordController.text);
                                    _emailController.text = '';
                                    _passwordController.text = '';
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Center(
                                      child: Text(
                                        'Asik Udah ke Register Nih Akunnya',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Color(0xFF009933),
                                        ),
                                      ),
                                    )));
                                  } on FirebaseAuthException catch (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Center(
                                      child: Text(
                                        'Yah Masukin Emailnya yang bener dong',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    )));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
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
                                  LoadingDialog.dismissLoadingDialog(context);
                                }
                              },
                              child: Stack(
                                children: [
                                  Text(
                                    'REGISTER',
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
                                    'REGISTER',
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
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
