import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GlossaryScreen extends StatelessWidget {
  const GlossaryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //followedtutorial: https://www.youtube.com/watch?v=WuYOGBEOEOo&ab_channel=LearnFlutterwithMe
    // firebase collection access

    // instance of our firestore  collection
    CollectionReference glossary =
        FirebaseFirestore.instance.collection('glossary');
    return Scaffold(
        appBar: AppBar(
          title: Text('GLOSSARY'),
        ),
        body: SafeArea(
          // streambuilder builds itself based on the latest snapshot of interaction  of the stream
          // everytime our snapshot changes the builder gets upadted.
          child: StreamBuilder(
              // orders our collection by words alphabetically
              stream: glossary.orderBy('word').snapshots(),
              // our snapshot is asynchron,  and will contain the content of the query
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                // null  error
                //if it doesnt have data return empty text
                if (!snapshot.hasData) {
                  return Center(child: Text(''));
                } else {
                  return ListView(
                    // we ensure that the data is not null and get a list of documents thorugh which we gonna map
                    children: snapshot.data!.docs.map((glossary) {
                      return ListTile(
                        title: Text(
                          // word  to string and uppercase
                          glossary["word"].toString().toUpperCase(),
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          glossary["description"].toString().toUpperCase(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }).toList(),
                  );
                }
              }),
        ));
  }
}
