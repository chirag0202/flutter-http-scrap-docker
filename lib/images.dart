import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Images extends StatefulWidget {
      @override
      _Image createState() => _Image();
    }

class _Image extends State<Images> {
  String a='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
          title: Text('List all docker images',
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
                      webimage();
                      // print(cmd);
                    },
                    color: Colors.black,
                    child: Text('Click here to list the images',
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
  webimage() async {
  var url = "http://192.168.99.101/cgi-bin/webimage.py";
  var response = await http.get(url);
  print(response.body);
  setState(() {
          a = response.body;
      }
    );
  }
}