import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text("Mihir"),
                  accountEmail: Text("mihir@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                     backgroundImage:  NetworkImage("https://wallpaperaccess.com/full/2322668.jpg"),
                  ),
             ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text("Profile",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email",textScaleFactor: 1.2,style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
