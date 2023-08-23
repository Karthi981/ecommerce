import 'package:ecommerce/Constants.dart';
import 'package:flutter/material.dart';

import 'Cart.dart';


class Details1 extends StatefulWidget {
  late String id;
  late  String name;
  late String imageUrl;
  late String description;
  late  String oldPrice;
  late String price;

  Details1(
      this.id,
      this.name,
      this.imageUrl,
      this.description,
      this.price,
      this.oldPrice,
      );

  @override
  State<Details1> createState() => _Details1State();
}

class _Details1State extends State<Details1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);

        },
          icon: Icon(Icons.arrow_back,color: Colors.white,),),
        backgroundColor: Colors.black,
        title: Center(child: Text("Products",style: TextStyle(color: Colors.white),)),
      ),
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(widget.name,style: bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: NetworkImage(widget.imageUrl),
                      fit: BoxFit.fill
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,bottom: 8.0),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Description:",style: Big,)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,bottom: 8,right:16 ),
              child: Text(widget.description,
                style: TextStyle(wordSpacing: 5),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Price : \$${widget.price}",style: Big,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Row(
                  children: [
                    Icon(Icons.star),
                    SizedBox(width: 10,),
                    Text("Rating: ${widget.oldPrice}",style: TextStyle(fontSize: 18),)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,bottom: 10,right: 8.0),
              child: Center(
                child: Container(
                    height: 55,
                    width: 380,
                    child:ElevatedButton(
                        child: const Text("Add to Cart",
                            style: TextStyle(fontSize: 18)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(
                                0xFFBDBB56)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )
                            )
                        ),
                        onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=>
                                  Cart(widget.id,widget.imageUrl,widget.price,widget.name,widget.oldPrice)));
                        }
                    )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,bottom: 10.0,right: 8.0),
              child: Center(
                child: Container(
                    height: 55,
                    width: 380,
                    child:ElevatedButton(
                        child: const Text("Buy now",
                            style: TextStyle(fontSize: 18)
                        ),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40),
                                )
                            )
                        ),
                        onPressed: (){

                        }
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Text("Add to Wishlist",
                style: TextStyle(color: Color(0xFF3A91AB),height: 1.3),),
            ),

          ],
        ),
      ),
    );
  }
}
