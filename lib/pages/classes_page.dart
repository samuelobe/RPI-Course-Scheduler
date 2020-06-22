import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassesPage extends StatefulWidget {
  @override
  _ClassesPageState createState() => _ClassesPageState();
}

class _ClassesPageState extends State<ClassesPage> {
  final Firestore firestoreInstance = Firestore.instance;

  Stream<QuerySnapshot> _getCourses() {
    var courses = Firestore.instance.collection('courses').snapshots();
    return courses;
  }

  void _onPressed() async {
    // firestoreInstance
    //     .collection("courses")
    //     .getDocuments()
    //     .then((querySnapshot) {
    //   querySnapshot.documents.forEach((result) {
    //     print(result.data);
    //   });
    // });

    var result = await Firestore.instance.collection('courses').getDocuments();
    var documents = result.documents;

    documents.forEach((data) => print(data.documentID));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes'),
      ),
      body: StreamBuilder(
          stream: _getCourses(),
          builder: (context, snapshot) {
            print(snapshot.connectionState);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView();
          }),
      floatingActionButton: FloatingActionButton(
          onPressed: _onPressed, child: Icon(Icons.ac_unit)),
    );
  }
}
