import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class inventoryservice {
  static Future<bool> addInventory(User user, Inventory inventory, ) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          // .doc()
          .doc(user.uid)
          .collection('inventory')
          .add(inventory.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editInventory(
      User user, Inventory inventory, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          // .doc(docId)
          .doc(user.uid)
          .collection('inventory')
          .doc(docId)
          .update(inventory.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteInventory(User user, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          // .doc(docId)
          .doc(user.uid)
          .collection('inventory')
          .doc(docId)
          .delete();

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> copyFirestoreToRealtimeDB(User user) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      FirebaseDatabase database = FirebaseDatabase.instance;

      QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
          .collection('user')
          .doc(user.uid)
          .collection('inventory')
          .get();

      DatabaseReference databaseRef =
          database.reference().child('user').child(user.uid).child('inventory');

      querySnapshot.docs.forEach((document) {
        String documentId = document.id;
        Map<String, dynamic> data = document.data();

        databaseRef.child(documentId).set(data);
      });

      return true;
    } catch (e) {
      return false;
    }
  }
}
