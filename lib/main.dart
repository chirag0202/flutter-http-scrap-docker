import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

import 'deletecon.dart';
import 'deleteimage.dart';
import 'exec.dart';
import 'images.dart';
import 'ps.dart';

void main() {
  runApp(MyApp());
}

webps(cmd) async {
  var url = "http://192.168.99.101/cgi-bin/web.py?w=$cmd";
  var response = await http.get(url);
  print(response.body);
}

webrun(iname, oname, port, vol) async {
  var url =
      "http://192.168.99.101/cgi-bin/web.py?w=$port&x=$oname&y=$iname&z=$vol";
  var response = await http.get(url);
  print(response.body);
  webps("docker ps");
}

class MyApp extends StatelessWidget {
  String oname, iname, port, vol;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Docker App',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey.shade300,
            child: ListView(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        onChanged: (value) {
                          oname = value;
                        },
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter name of OS",
                          prefixIcon: Icon(Icons.tablet_android),
                        ),
                      ),
                      Divider(height: 20),
                      TextField(
                        onChanged: (value) {
                          iname = value;
                        },
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter name of image",
                          prefixIcon: Icon(Icons.tablet_android),
                        ),
                      ),
                      Divider(height: 20),
                      TextField(
                        onChanged: (value) {
                          port = value;
                        },
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter port number",
                          prefixIcon: Icon(Icons.tablet_android),
                        ),
                      ),
                      Divider(height: 20),
                      TextField(
                        onChanged: (value) {
                          vol = value;
                        },
                        autocorrect: false,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText:
                              "Enter volume bind(host/path:/container/path)",
                          prefixIcon: Icon(Icons.tablet_android),
                        ),
                      ),
                      Divider(height: 20),
                      FlatButton(
                          onPressed: () {
                            webrun(iname, oname, port, vol);
                            // print(cmd);
                          },
                          color: Colors.black,
                          child: Text(
                            'click here',
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          drawer: Drawerbar()),
    );
  }
}

class Drawerbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
              children: <Widget>[
                Text(
                  'Options',
                  style: TextStyle(color: Colors.white, fontSize: 19),
                ),
                Container(
                    width: 200,
                    height: 110,
                    child: Image.asset("images/logo.png") // Image.network(
                    //"https://tinyurl.com/yyq9pz9o"), //"https://miro.medium.com/max/630/1*j_zP74-cpvXRcs8dM_pkMQ.jpeg"
                    )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text('Run an OS'),
            onTap: () {
              // Update the state of the app

              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => MyApp()),
              );
            },
          ),
          ListTile(
            title: Text('List the Images'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Images()),
              );
            },
          ),
          ListTile(
            title: Text('List all the Containers'),
            onTap: () {
              // Update the state of the app
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Psa()),
              );
              // Then close the drawer
            },
          ),
          ListTile(
            title: Text('Delete Containers'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DeleteContainer()),
              );
            },
          ),
          ListTile(
            title: Text('Delete Images'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => DeleteImage()),
              );
            },
          ),
          ListTile(
            title: Text('Execute a command inside the OS'),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) => Exec()),
              );
            },
          ),
        ],
      ),
    );
  }
}
