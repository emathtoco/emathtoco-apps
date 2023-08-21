import 'package:flutter/material.dart';

class FullImageScreen extends StatelessWidget {
  const FullImageScreen({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            iconSize: 30,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close)),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
          child: InteractiveViewer(
              maxScale: 3,
              child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.contain,
                  )))),
    );
  }
}
