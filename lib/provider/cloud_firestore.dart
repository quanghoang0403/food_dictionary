import 'package:cloud_firestore/cloud_firestore.dart';
Map data;
Map fletch_data(){
  CollectionReference collectionReference = FirebaseFirestore.instance.collection('mother_day');
  collectionReference.snapshots().listen((snapshot) {
    data = snapshot.docs[0].data();
  });
  return data;
}