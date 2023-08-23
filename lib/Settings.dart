import 'package:ecommerce/Login/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Constants.dart';



class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {


  late SharedPreferences logindata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    logindata= await SharedPreferences.getInstance();
  }

  void _showAlertDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Log out'),
          content: Text('Are you sure you want to Log out?'),
          actions: [
            TextButton(
              onPressed: () {
                logindata.setBool("login",false);
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
            TextButton(
              onPressed: () {
                logindata.setBool("login",true);
                Navigator.push(context,
                 MaterialPageRoute(builder: (context)=>Login()),
                );
              },
              child: Text('Yes'),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text("Profile")),
        actions: [Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.notification_add),
        )],
      ),
      body: SingleChildScrollView(
        child: Column(

          children: [
            SizedBox(
              height: 40,
            ),
            Center(
              child: Container(
                height: 120,
                width: 120,
          decoration: BoxDecoration(
          shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage("https://wallpapers.com/images/hd/cool-profile-picture-87h46gcobjl5e4xu.jpg"),
              fit: BoxFit.fill)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Center(child: Text("Kabby",style: Heading,)),
            Center(child: Text("Kabby7756@gmail,com",style: SubHeading,)),
            SizedBox(height: 20,),
            Center(
              child: Container(
                height: 50,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: ElevatedButton(onPressed: (){}, child: Text("Edit Profile",style: SubHeading,),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  ),
                  )),
            ),
            SizedBox(height: 30,),
            Divider(),
            SizedBox(height: 10,),
            ProfileNew(title: "Settings",icon: Icons.settings,isendicon: true,),
            ProfileNew(title: "Settings",icon: Icons.wallet,isendicon: true),
            ProfileNew(title: "Settings",icon:Icons.verified_user,isendicon: true),
            ProfileNew(title: "Settings",icon:Icons.info,isendicon: true),
            GestureDetector(

                onTap: _showAlertDialog,
                child: ProfileNew(title: "Logout", icon: Icons.logout,isendicon: true)),

          ],
        ),
      ),
    );
  }
}

class ProfileNew extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isendicon;

  const ProfileNew({
    super.key,
    required this.title,
    required this.icon,
    required this.isendicon,

  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70,
        width: 350,
        child: ListTile(
          leading: Container(
            height: 40,
              width: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color:Colors.blue[200]
              ),
              child: Icon(icon)),
          title: Text(title),
          trailing: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:Colors.grey.withOpacity(0.1)
              ),
              child: isendicon ? Icon(Icons.arrow_forward,size: 18.0,color: Colors.grey): null,
        ),
      ),
    )
    );
  }
}
