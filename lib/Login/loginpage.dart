
import 'package:ecommerce/Constants.dart';
import 'package:ecommerce/Login/Imagetransition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  static final _formfield = GlobalKey<FormState>();
  final usercontroller = TextEditingController();
  final passcontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      onWillPop: ()async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
                top: -10,
                left: -150,

                child: Row(
              children: [
                 Imageview(StartIndex: 0,),
                 Imageview(StartIndex: 1,),
                 Imageview(StartIndex: 2,),

              ],
            )),
            Positioned(
                top: MediaQuery.of(context).size.height * 0.08,
                child: Text("EValy",
                  style: Super,
                  textAlign: TextAlign.center,)),
            Positioned(
              bottom: 0,
              child: Container(
              height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.white54,
                  Colors.white,
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.center,
              ),
            ),
            ),
            ),
            Positioned(
                bottom: 50,

                child: Container(
              height: 300,
              width: 300,
                  child: Form(
                    key: _formfield,
                    child: Column(
                       children: [
                         Container(
                             height: 50,
                             width: 200,
                             child: ElevatedButton(onPressed: (){
                               if(_formfield.currentState!.validate()){
                                 signup();
                               }
                               else {
                                 debugPrint('LOG: Username and password not valid');
                                 ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(content: Text(" Username or password not valid"),
                                       backgroundColor: Colors.red[300],)
                                 );
                               }
                             }, child: Text("Sign Up",
                             style: TextStyle(color: Colors.white),),

                             style: ButtonStyle(
                               backgroundColor: MaterialStateProperty.all(Colors.blue[700]),
                             ),
                             )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: usercontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Username';
                          }
                          final uservalid = RegExp(r"^[a-zA-Z0-9_]").hasMatch(value);
                          if (!uservalid) {
                            return "Enter Valid Username";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Username",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: passcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Password';
                          }
                          final uservalid = RegExp(
                              r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$").hasMatch(value);
                          if (!uservalid) {
                            return "Enter Valid Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.password),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(onPressed: (){
                        if (_formfield.currentState!.validate()) {
                          login();
                      }

                        }, child: Text("Login",style: TextStyle(color: Colors.black),)),
                    ),
                ],
              ),
                  ),
            ))
          ],
        ),
      ),
    );
  }
  Future<void>login()async{
    try{
      final _auth = FirebaseAuth.instance;
      _auth.signInWithEmailAndPassword(
          email: usercontroller.text, password: passcontroller.text);
    }on FirebaseAuthException catch (e){
      print(e);

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!),
            backgroundColor: Colors.red[300],)
      );
    }
  }
  Future<void>signup()async{
    try{
      final auth = FirebaseAuth.instance;
      auth.createUserWithEmailAndPassword(
          email: usercontroller.text, password: passcontroller.text);
    }on FirebaseAuthException catch (e){
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message!),
          backgroundColor: Colors.red[300],)
      );
    }
  }
  void dispose(){
    usercontroller.dispose();
    passcontroller.dispose();
    super.dispose();
  }
}
