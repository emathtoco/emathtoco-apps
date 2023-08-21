import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(cobarealtime());
}

class cobarealtime extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: 'menaraalif@gmail.com',
        password: '111101al',
      );

      if (userCredential.user != null) {
        print('Sign in success!');
        // Lakukan operasi lainnya setelah berhasil login
      }
    } catch (e) {
      print('Sign in failed. Error: $e');
    }
  }

  Future<void> _signOut() async {
    try {
      await _auth.signOut();
      print('Sign out success!');
    } catch (e) {
      print('Sign out failed. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Auth Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text('Sign In'),
                onPressed: _signInWithEmailAndPassword,
              ),
              ElevatedButton(
                child: Text('Sign Out'),
                onPressed: _signOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
