import 'package:ecommerce/trackorde/trackeer.dart';
import 'package:flutter/material.dart';



class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu),
        ),
        title: Center(child: Text("Track Orders")),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("CANCEL"),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: Row(
                children: [
                  Container(
                      width: 196.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green[200],
                      ),
                      child: Center(child: Text("ESTIMATED TIME\n   30 MINS"))),
                  Divider(),
                  Container(
                      width: 196.5,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.green[200],
                      ),
                      child: Center(child: Text("ORDER NUMBER\n   #003476R"))),
                ],
              ),
            ),
            Material(
              elevation: 15,
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      Tracker(isFirst: true,
                        isLast: false, isPast:
                        true , child:Text("Order Placed") ,
                      imgurl: "https://thumbs.dreamstime.com/b/order-placed-confirmed-transaction-vector-icon-checklist-check-mark-accepted-outline-illustration-eps-263525065.jpg",),
                      Tracker(isFirst: false, isLast: false, isPast: true,
                        child: Text("Order Confirmed"),
                      imgurl: "https://previews.123rf.com/images/gigisomplak/gigisomplak1712/gigisomplak171200331/92622197-sketch-two-man-hand-shaking.jpg",),
                      Tracker(isFirst: false, isLast: false, isPast: false,
                        child:Text("Order Processed") ,
                      imgurl: "https://i.pinimg.com/originals/9c/29/4f/9c294f8065e7f25ae1c7fc2bc0c3c3d7.jpg",),
                      Tracker(isFirst: false, isLast: false, isPast: false,
                        child: Text("Out to Delivery"),
                      imgurl: "https://img.freepik.com/premium-vector/man-is-riding-scooter_753539-215.jpg",),
                    Tracker(isFirst: false, isLast: true, isPast: false,
                        child: Text("Bringing to Home"),
                        imgurl: "https://v.etsystatic.com/video/upload/q_auto/n14_pktj6l.jpg"),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
