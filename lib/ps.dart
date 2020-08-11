import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Psa extends StatefulWidget {
      @override
      _Psastate createState() => _Psastate();
    }

class _Psastate extends State<Psa> {
  String a='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
          title: Text('List all docker containers',
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
                FlatButton(
                    onPressed: () {
                      a=webpsa();
                      // print(cmd);
                    },
                    color: Colors.black,
                    child: Text('Click here to display the containers',
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
  webpsa() async {
  var url = "http://192.168.99.101/cgi-bin/webps.py";
  var response = await http.get(url);
  print(response.body);
  setState(() {
          a = response.body;
        });
}
}