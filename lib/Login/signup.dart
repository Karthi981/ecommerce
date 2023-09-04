import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/BottomNavigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  TextEditingController txtlog =new TextEditingController();
  TextEditingController txtname =new TextEditingController();
  TextEditingController txtphone =new TextEditingController();
  TextEditingController txtpwd =new TextEditingController();
  TextEditingController rpwd =new TextEditingController();
  final gkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: gkey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,

          decoration:BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white12,
                  Colors.black26,
                  Colors.white70,
                  Colors.black26,

                ]),

          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: txtname,


                    decoration: InputDecoration(


                      errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(.5),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Name",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      String? regx = r'^[a-z A-Z]';
                      RegExp rgx = new RegExp(regx);

                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else if (!rgx.hasMatch(value)) {
                        return 'use only alphabets';
                      } else
                        return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: txtlog,


                    decoration: InputDecoration(


                      errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(.5),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Mail-id",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      String? regx = r'\S+@\S+\.\S+';
                      RegExp rgx = new RegExp(regx);

                      if (value == null || value.isEmpty) {
                        return 'Please enter  mail-id';
                      } else if (!rgx.hasMatch(value)) {
                        return 'Enter valid one';
                      } else
                        return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: txtphone,
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(


                      errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(.5),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Mobile number",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    validator: (value) {
                      String? regx =  r'^(?:[+0]9)?[0-9]{10}$';
                      RegExp rgx = new RegExp(regx);

                      if (value == null || value.isEmpty) {
                        return 'Please enter mob no';
                      } else if (!rgx.hasMatch(value)) {
                        return 'Number Incorrect';
                      } else
                        return null;
                    }

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: txtpwd,
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(


                      errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(.5),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    validator: (value) {
                      String? regx = r'^[a-z A-Z]';
                      RegExp rgx = new RegExp(regx);

                      if (value == null || value.isEmpty) {
                        return 'Please enter Password';
                      } else if (!rgx.hasMatch(value)) {
                        return 'Enter valid one';
                      } else
                        return null;
                    }

                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                    controller: rpwd,
                    maxLines: 1,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: InputDecoration(


                      errorStyle:TextStyle(color: Colors.redAccent,fontSize: 18) ,
                      filled: true,
                      fillColor: Colors.blueGrey.withOpacity(.5),
                      border: OutlineInputBorder(

                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Re-Password",
                      prefixIcon: const Icon(Icons.password),
                    ),
                    validator: (value) {

                      if (value == null || value.isEmpty) {
                        return ' cannot be empty';
                      } else if (txtpwd.text!=rpwd.text) {
                        return 'Please re-enter password correctly';
                      } else
                        return null;
                    }

                ),
              ),

              SizedBox(height: 30,
                width: 120,
                child: ElevatedButton(onPressed: () {
                  if(gkey.currentState!.validate())
                  {
                    signup(txtname.text, txtlog.text, txtphone.text,txtpwd.text);



                    // ScaffoldMessenger.of(context).showSnackBar(
                    //
                    //   const SnackBar(content: Text('Welcome Enjoy ur Day',style: TextStyle(color: Colors.white,fontSize: 20),)),
                    //

                    //  );
                  }
                  //txtlog.clear();
                  //txtpwd.clear();

                },
                  child: const Center(child: Text("Sign Up",style: TextStyle(fontSize: 20,color: Colors.white60),)),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black.withOpacity(.5),),
                ),
              ),


            ],
          ),
        ),
      )
    );
  }
  Future<void>signup(String name,String emailid,String phonenum,String password)async{
    try{
      final auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(
          email: txtlog.text, password: txtpwd.text);
    }on FirebaseAuthException catch (e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("something wrong"),
            backgroundColor: Colors.red[300],)
      );
    }

    final uid = FirebaseAuth.instance.currentUser!.uid;
    final adddata=FirebaseFirestore.instance.collection('users').doc(uid);
    final json={
      "name":name,
      "emailid":emailid,
      "monilenum":phonenum,
      "password":password
    };
    await adddata.set(json);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bottom()));
  }
}
