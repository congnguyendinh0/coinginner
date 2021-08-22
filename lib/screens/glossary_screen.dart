import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    CollectionReference glossary =
        FirebaseFirestore.instance.collection('glossary');
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Glossary'),
        ),
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
