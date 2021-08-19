import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FireStoreApp());
}

class FireStoreApp extends StatefulWidget {
  const FireStoreApp({Key? key}) : super(key: key);

  @override
  _FireStoreAppState createState() => _FireStoreAppState();
}

class _FireStoreAppState extends State<FireStoreApp> {
  @override
  Widget build(BuildContext context) {
    // reference to glossary collection in firebase
    CollectionReference glossary =
        FirebaseFirestore.instance.collection('glossary');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: StreamBuilder(
              stream: glossary.orderBy('word').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: snapshot.data!.docs.map((glossary) {
                    return Center(
                      child: ListTile(
                        title: Text(glossary["word"]),
                        subtitle: Text(glossary["description"]),
                      ),
                    );
                  }).toList(),
                );
              }),
        ),
      ),
    );
  }
}
