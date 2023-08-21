import 'package:flutter/material.dart';

class LoadingDialog {
  static showLoadingDialog(BuildContext context) {
    final loadingDialog = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(width: 2, color: Colors.black),
      ),
      content: Row(
        children: const [
          CircularProgressIndicator(),
          SizedBox(width: 20),
          Text(
            'Loading',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Colors.black,
            ),
          )
        ],
      ),
    );

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => loadingDialog,
    );
  }

  static dismissLoadingDialog(BuildContext context) {
    Navigator.pop(context);
  }
}
