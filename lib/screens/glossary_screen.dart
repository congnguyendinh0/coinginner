import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //followedtutorial: https://www.youtube.com/watch?v=WuYOGBEOEOo&ab_channel=LearnFlutterwithMe
    // firebase collection access

    // instance of
    CollectionReference glossary =
        FirebaseFirestore.instance.collection('glossary');
    return Scaffold(
        appBar: AppBar(
          title: Text('GLOSSARY'),
        ),
        body: SafeArea(
          child: StreamBuilder(
              // orders words
              stream: glossary.orderBy('word').snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: Text(''));
                }
                return ListView(
                  children: snapshot.data!.docs.map((glossary) {
                    return ListTile(
                      title: Text(
                        glossary["word"],
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        glossary["description"],
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                );
              }),
        ));
  }
}
