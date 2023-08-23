
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:getwidget/position/gf_position.dart';


class Ecom1 extends StatefulWidget  {
  const Ecom1({Key? key}) : super(key: key);

  @override
  State<Ecom1> createState() => _Ecom1State();
}

class _Ecom1State extends State<Ecom1> {

  final List products = [
    ("https://i.imgur.com/go8ATvd.jpeg"),
    ("https://i.imgur.com/T99x0AL.jpeg"),
    ("https://i.imgur.com/iDDyWjU.jpeg"),
    ("https://i.imgur.com/xpdBMIn.jpeg"),
    ("https://i.imgur.com/GmVxWM7.png"),
    ("https://i.imgur.com/ZBiOtjh.png"),
    ("https://media.istockphoto.com/id/492201907/photo/many-tools.jpg?s=1024x1024&w=is&k=20&c=6Z5B8PLwkJZtvzXebggAhAqP721U1t_Bw_ap1bNenwI="),
    ("https://media.istockphoto.com/id/1212526330/photo/bohemian-living-room-interior-3d-render.jpg?s=1024x1024&w=is&k=20&c=hN2-XQw5om6PDgEK9VBO6lhglNCqogFbRs8yiJiTRtQ="),
  ];
  final List categories = [
    ('mens-fashion'),
    ('womens-fashion'),
    ('jewlary-and-watches'),
    ('bags-and-shoes'),
    ("Computers"),
    ('phone-and-tablets'),
    ('tools & hardware'),
    ('home-and-furniture'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       backgroundColor: Colors.white,
        title: Text("    Category",style: TextStyle(fontSize: 24),),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_active)),
          Image.network("https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg?w=2000"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 45,
            ),
            Container(
              height: 50,
              width: 340,
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: "Search Category",
                  prefixIcon: Icon(Icons.search),

                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 600,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children: [
                        GFCard(
                          height: 160,
                          borderRadius: BorderRadius.circular(20),
                          boxFit: BoxFit.cover,
                          titlePosition: GFPosition.start,
                          showOverlayImage: true,
                          imageOverlay: NetworkImage(products[index]),
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 229, 166, 198),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            child: Text(categories[index],
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: products.length,
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }

}
