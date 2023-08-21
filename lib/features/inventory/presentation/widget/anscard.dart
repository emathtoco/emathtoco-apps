import 'package:aplikasi_ta/features/inventory/data/model/Inventory.dart';
import 'package:aplikasi_ta/features/inventory/presentation/filedetail.dart';
import 'package:flutter/material.dart';

class anscard extends StatelessWidget {
  const anscard({super.key,required this.inventory, required this.docId});

  final Inventory inventory;
  final String docId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => filedetail(docId: docId),
            ));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        width: double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.book),
            SizedBox(
              width: 10,
            ),
            Text(
              'No ${inventory.soal}',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
