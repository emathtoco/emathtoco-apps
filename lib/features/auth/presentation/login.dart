import 'package:aplikasi_ta/core/widget/loading_dialog.dart';
import 'package:aplikasi_ta/features/auth/data/auth_service.dart';
import 'package:aplikasi_ta/features/auth/presentation/register.dart';
import 'package:aplikasi_ta/features/inventory/presentation/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class login extends StatefulWidget {
  login({
    super.key,
  });

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var obscurePassword = true;

  late TextEditingController _emailcontroller;
  late TextEditingController _passwordcontroller;

  final _keylogem = GlobalKey<FormState>();
  final _keylogpas = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    _emailcontroller = TextEditingController();
    _passwordcontroller = TextEditingController();
  }

  @override
  void dispose() {
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
                'assets/images/Fig 11.png',
                width: 635.98,
                height: 400,
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: AlignmentDirectional(-1, 1),
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/Fig 22.png',
                  width: 490.07,
                  height: 400,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // SizedBox( height: 500,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Email',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: _keylogem,
                    child: Column(
                      children: [
                        ClipRRect(
                          child: TextFormField(
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
                            controller: _emailcontroller,
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: _keylogpas,
                    child: Column(
                      children: [
                        ClipRRect(
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
                                      ? Icon(Icons.visibility_off)
                                      : Icon(Icons.visibility_rounded)),
                              hintText: 'Password',
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 250,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                        onPressed: () async {
                          if (_keylogem.currentState!.validate() ||
                              _keylogpas.currentState!.validate()) {
                            LoadingDialog.showLoadingDialog(context);
                            try {
                              final result = await AuthService.login(
                                  _emailcontroller.text,
                                  _passwordcontroller.text);
                            } on FirebaseAuthException catch (e) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'New to',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        ClipRRect(
                          child: Image.asset(
                            'assets/images/EMATH TOCO2.png',
                            width: 98,
                            height: 22,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          '?',
                          style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                        TextButton(
                          onPressed: () {
                            showGeneralDialog(
                              barrierDismissible: true,
                              barrierLabel: '',
                              barrierColor: Color(0xFFFFFFFF).withOpacity(0.75),
                              transitionDuration: Duration(milliseconds: 300),
                              context: context,
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return Align(
                                  alignment: Alignment.center,
                                  child: SlideTransition(
                                    position: Tween<Offset>(
                                      begin: Offset(0, 1),
                                      end: Offset.zero,
                                    ).animate(animation),
                                    child: register(),
                                  ),
                                );
                              },
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFF0084BC),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
