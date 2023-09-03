import 'package:cloud_firestore/cloud_firestore.dart';

class Cartdata{
  final String image;
  final String price;
  final String rating;
  final String title;

  Cartdata({
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
});

  Map<String , dynamic> toJson() {
    return
      {
        'image' : image,
        'price' : price,
        'rating' : rating,
        'title'  : title
    };
  }


  factory Cartdata.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return Cartdata(
      image:data ['image'],
      price: data['price'],
      rating: data['rating'],
      title: data['title']
  );
  }
}