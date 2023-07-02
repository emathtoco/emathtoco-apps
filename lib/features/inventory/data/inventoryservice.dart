import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class inventoryservice {
  static Future<bool> addInventory(Inventory inventory) async {
    try {
      await FirebaseFirestore.instance
          .collection('inventory')
          .add(inventory.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> editInventory(Inventory inventory, String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('inventory')
          .doc(docId)
          .update(inventory.toMap());

      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> deleteInventory(String docId) async {
    try {
      await FirebaseFirestore.instance.collection('inventory').doc(docId).delete();

      return true;
    } catch (e) {
      return false;
    }
  }
}
