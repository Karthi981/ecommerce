import 'package:ecommerce/Login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Cart.dart';
import 'Constants.dart';

class Details extends StatefulWidget {

  final String Title;
  final String Price;
  final String Description;
  final String prodId;
  final String image;
  final String Rating;
  Details(
    this.prodId,
    this.image,
    this.Description,
    this.Price,
    this.Title,
    this.Rating
);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  late SharedPreferences logindata;
  late bool newUser;

  // @override
  // void initState(){
  //   super.initState();
  //   check_if_login();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                child: Center(child: Text(widget.Title,style: bold)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        image: NetworkImage(widget.image),
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
                child: Text(widget.Description,
                  style: TextStyle(wordSpacing: 5),
                  textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Price : \$${widget.Price}",style: Big,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.star),
                      SizedBox(width: 10,),
                      Text("Rating: ${widget.Rating}",style: TextStyle(fontSize: 18),)
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
                                    Cart(widget.prodId,widget.image,widget.Price,widget.Title,widget.Rating)));
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
                padding: EdgeInsets.only(left: 8.0),
                child: Text("Add to Wishlist",
                  style: TextStyle(color: Color(0xFF3A91AB),height: 1.3),),
              ),

            ],
          ),
        ),

      ),
    );
  }
  // void check_if_login() async {
  //   logindata = await SharedPreferences.getInstance();
  //   newUser = logindata.getBool("login")?? true ;
  //   if (newUser == false){
  //
  //     Navigator.push(context, MaterialPageRoute(builder: (context) => Cart()));
  //
  //   }
  // }

}
