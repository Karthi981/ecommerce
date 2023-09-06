import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Addproducts extends StatelessWidget {
  const Addproducts({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController title = new TextEditingController();
    TextEditingController description = new TextEditingController();
    TextEditingController image = new TextEditingController();
    TextEditingController price = new TextEditingController();
    TextEditingController rating = new TextEditingController();
    TextEditingController proId = new TextEditingController();
    final _formfield1 = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formfield1,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: title,
                  decoration: InputDecoration(
                    hintText: 'title',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: description,
                  decoration: InputDecoration(
                    hintText: 'description',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: image,
                  decoration: InputDecoration(
                    hintText: 'image',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: price,
                  decoration: InputDecoration(
                    hintText: 'price',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: rating,
                  decoration: InputDecoration(
                    hintText: 'rating',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Data';
                    }
                    return null;
                  },
                  controller: proId,
                  decoration: InputDecoration(
                    hintText: 'proId',
                    border: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),

                  ),
                ),
              ),
            ),
            ElevatedButton(onPressed: () {
              if(_formfield1.currentState!.validate()){
                    Addproduct(proId.text, title.text, image.text, price.text,
                        rating.text, description.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Added Successfully"),
                      backgroundColor: Colors.red[300],
                    ));
                    title.clear();
                    image.clear();
                    description.clear();
                    price.clear();
                    rating.clear();
                    // proId=int.parse(proId.text)+1;
                  }
                },
                child: Text("Add products")),
          ],
        ),
      ),
    );
  }

  Future<void> Addproduct(String proId, String title, String image,
      String price, String rating, String descrip) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final uid = auth.currentUser!.uid;

    final docUser = FirebaseFirestore.instance
        .collection('users').doc(uid).collection('products').doc(proId);
    final json = {
      'image': image,
      'description': descrip,
      'title': title,
      'price': price,
      'rating': rating
    };
    await docUser.set(json);
  }
}
