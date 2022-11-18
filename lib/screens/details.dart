import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    CollectionReference leaves = FirebaseFirestore.instance.collection('user request');
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: textController,
        ),
      ),
      body: Center(
        child: StreamBuilder(
            stream: leaves.orderBy('name').snapshots(),
            builder: (context ,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData)
              {
                return Center(child: Text('Loading'),);
              }
              return ListView(
                children: snapshot.data!.docs.map((leave) {
                  return Center(
                    child: ListTile(
                      title: Text(leave['name']),
                      onLongPress: () {
                        leave.reference.delete();
                      },
                    ),
                  );
                }).toList(),
              );
            }
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:  Icon(Icons.save),
        onPressed: () {
          leaves.add({
            'name' : textController.text,
          });
          textController.clear();
        },
      ),
    );
  }
}

