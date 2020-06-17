import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassesPage extends StatefulWidget {
  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  void _getCourses() {
    Firestore.instance.collection('courses').getDocuments().then((value) {
      value.documents.forEach((element) {
        print('yeet');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _getCourses, child: Icon(Icons.ac_unit)),
    );
  }
}
