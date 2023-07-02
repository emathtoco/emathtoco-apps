// ignore_for_file: unused_import, camel_case_types

import 'package:aplikasi_ta/features/auth/data/auth_service.dart';
import 'package:aplikasi_ta/features/auth/presentation/login.dart';
import 'package:aplikasi_ta/features/inventory/presentation/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class wrapper extends StatelessWidget {
  wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: AuthService.userStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return  home();
        }
        return  login();
      
    },);
  }
}