import 'package:flutter/material.dart';
import 'pdf_home.dart';

void main() => runApp(PDFApp());

class PDFApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PDF Download Manager',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: PDFHomePage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

