import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce/Home.dart';
import 'package:ecommerce/Settings.dart';
import 'package:ecommerce/TimeDelivery.dart';
import 'package:ecommerce/eCom%201.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:wifi_iot/wifi_iot.dart';


class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);

  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> with TickerProviderStateMixin {

  late ConnectivityResult result;
  late StreamSubscription subscription;
  var isConnect = true;


  checkinternet()async{
    result = await Connectivity().checkConnectivity();
    if(result!=ConnectivityResult.none){
      isConnect=true;

    }
    else {
      isConnect=false;
      //showDialogbox();
    }
    setState(() {
    });
  }

  Startstreaming(){

    subscription = Connectivity().onConnectivityChanged.listen((event)async {
      checkinternet();
    });
  }

  showDialogbox(){

    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context)=>CupertinoAlertDialog(
          title: Text("No Tnternet"),
          content: Text("Please check ypur internet Connection"),
          actions: [
            ElevatedButton(onPressed: (){
              checkinternet();
            }, child: Text("Retry"))],
    ));
  }

  final pages = [
    Home(),
    Ecom1(),
    Delivery(),
    Settings()
  ];
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Startstreaming();
    print(isConnect);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: isConnect? pages.elementAt(_selectedIndex):
          Center(child: GestureDetector(

              onTap: (){

                checkinternet();
              },
              child: Image.asset("assets/Nonet.jpg"))),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(.1),
                )
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 8,
                  activeColor: Colors.black,
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: Duration(milliseconds: 400),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Colors.black,
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.category,
                      text: 'Likes',
                    ),
                    GButton(
                      icon: Icons.shopping_cart_checkout,
                      text: 'Track Order',
                    ),
                    GButton(
                      icon: Icons.person,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),


        ),
      ),
    );
  }
}
