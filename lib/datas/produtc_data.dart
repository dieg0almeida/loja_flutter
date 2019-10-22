import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData{
  String id;
  String title;
  String description;
  double price;

  List images;

  String category;

  ProductData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"];
    images = snapshot.data["images"];
  }

  Map<String, dynamic> toResumeMap(){
    return{
      "title" : title,
      "description" : description,
      "price" : price
    };
  }
}