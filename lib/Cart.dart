
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';





class Cart extends StatefulWidget {


  const Cart({super.key});


  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  List<Map<String,dynamic>> items =[];


  // Future<List<Carts>> readcart()async{
  //   var snapshot = await FirebaseFirestore.instance.collection('cart').get();
  //   var cart = snapshot.docs.map((e) => Carts.fromSnapshot(e)).toList();
  //   print(cart);
  //   return cart;
  // }
  Future getCartId() async {
    List<Map<String,dynamic>> tempList =[];
     var data =await FirebaseFirestore.instance.collection('users').doc(uid).collection('cart').get();
     data.docs.forEach((element) {
       tempList.add(element.data());
     });
     setState(() {
       items=tempList;
     });
     print(items[0]);
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  List lis =[
    "https://ichef.bbci.co.uk/news/976/cpsprodpb/13729/production/_112375697_1331db7a-17c0-4401-8cac-6a2309ff49b6.jpg",
    "https://image.api.playstation.com/vulcan/img/rnd/202010/2217/p3pYq0QxntZQREXRVdAzmn1w.png",
    "https://rukminim2.flixcart.com/image/850/1000/k63xle80/code-in-the-box-game/7/y/u/pc-red-dead-redemption-2-pc-standard-edition-original-imafzmkyques8mxp.jpeg?q=90",
    "https://store-images.s-microsoft.com/image/apps.58752.68182501197884443.ac728a87-7bc1-4a0d-8bc6-0712072da93c.0cf58754-9802-46f8-8557-8d3ff32a627a?q=90&w=480&h=270",
    "https://cdn.akamai.steamstatic.com/steam/apps/271590/capsule_616x353.jpg?t=1678296348",
    "https://cdn1.smartprix.com/rx-i1ovwUq99-w420-h420/xiaomi-redmi-note-11.jpg",
    "data:image/jpeg;base64,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",
    "https://cdn.akamai.steamstatic.com/steam/apps/243470/capsule_616x353.jpg?t=1680017857",
  ];


  String dropdownvalue1 = "Qty:1";
  var nums1 = [

    'Qty:1',
    'Qty:2',
    'Qty:3',
    'Qty:4',
    'Qty:5',

  ];

  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
          backgroundColor: Colors.black,
                leading: IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: const Icon(Icons.arrow_back),color: Colors.white,),
                title: const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text("My Cart",style:TextStyle(color: Colors.white,fontSize: 20)),
                ),
                ),
        body: FutureBuilder(
          future: getCartId(),
          builder: (context,snapshot) {
           if(items.length>0){
             return ListView.builder(
                 itemCount: items.length,
                 itemBuilder: (context,index) {
                   return
                     Dismissible(
                       // Each Dismissible must contain a Key. Keys allow Flutter to
                       // uniquely identify widgets.
                       key: Key(items[index]['title']),
                       // Provide a function that tells the app
                       // what to do after an item has been swiped away.
                       onDismissed: (direction) {
                         // Remove the item from the data source.
                         setState(() {
                           FirebaseFirestore.instance.collection('users').doc(uid).collection('cart').doc('1').delete();
                           items.removeAt(index);

                         });

                         // Then show a snackbar.
                         ScaffoldMessenger.of(context)
                             .showSnackBar(SnackBar(content: Text('${items[index]['title']} dismissed')));
                       },
                       // Show a red background as the item is swiped away.
                       background: Container(color: Colors.red),
                       child: ListTile(
                         title: Text(items[index]['title']),
                       ),
                     );

                   //   Padding(
                   //   padding: const EdgeInsets.all(8.0),
                   //   child: Container(
                   //     height: 80,
                   //     child: ListTile(
                   //       title: Text(items[index]['title']),
                   //       leading: Container(
                   //         height: 50,
                   //         width: 50,
                   //         decoration: BoxDecoration(
                   //           shape: BoxShape.rectangle,
                   //           image: DecorationImage(image: NetworkImage(items[index]['image']))
                   //         ),
                   //       ),
                   //       // leading: Text(items[index]['image'].toString()),
                   //       trailing: Text("\$:${items[index]['price']}"),
                   //       subtitle: Text(items[index]['rating']),
                   //     ),
                   //   ),
                   // );
                 }
             );
           }
           else if(items.length<1){
             return Center(
               child: Column(
                 children: [
                   SizedBox(height: 300),
                   CircularProgressIndicator(

                   ),
                   Text("Loding Please Wait",style: TextStyle(fontSize: 24),),
                 ],
               ),
             );
           }
           else{
             return Center(child: CircularProgressIndicator());
           }
          }
        ),

      )
    );
  }
  // Widget getbuild(BuildContext context) {
  //   return new StreamBuilder<QuerySnapshot>(
  //       stream: Firestore.instance.collection("expenses").snapshots,
  //       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
  //         if (!snapshot.hasData) return new Text("There is no expense");
  //         return new ListView(children: getExpenseItems(snapshot));
  //       });
  // }
  // getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
  //   return snapshot.data.documents
  //       .map((doc) => new ListTile(title: new Text(doc["name"]), subtitle: new Text(doc["amount"].toString())))
  //       .toList();
  // }
}
