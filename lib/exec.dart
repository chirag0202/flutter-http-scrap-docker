import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Exec extends StatefulWidget {
      @override
      _Exec createState() => _Exec();
    }

class _Exec extends State<Exec> {
  String a='';
  String cmd,cname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
          title: Text('Execute command inside container',
          style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(icon:Icon(Icons.arrow_back), onPressed:() => Navigator.pop(context,false),),
          backgroundColor: Colors.black,
        ),
      body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.shade300,
            padding: EdgeInsets.all(20),
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    cname = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter name of container",
                    prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                Divider(height: 8),
                TextField(
                  onChanged: (value) {
                    cmd = value;
                  },
                  autocorrect: false,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter command that is to be executed inside the container",
                    prefixIcon: Icon(Icons.tablet_android),
                  ),
                ),
                Divider(height: 8),
                FlatButton(
                    onPressed: () {
                      webdeli(cname,cmd);
                      // print(cmd);
                    },
                    color: Colors.black,
                    child: Text('click here',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
                Divider(height: 20),
                Container(
                  color: Colors.white,
                  child: Text(
                        a,
                        style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ),
              ],
            ),
          ),
    );
  }
  webdeli(cname,cmd) async {
  var url = "http://192.168.99.101/cgi-bin/webexec.py?w=$cname&x=$cmd";
  var response = await http.get(url);
  print(response.body);
  setState(() {
          a = response.body;
      }
    );
}
}