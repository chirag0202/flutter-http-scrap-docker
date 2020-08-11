import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

webimage() async {
  var url = "http://192.168.99.101/cgi-bin/webimage.py";
  var response = await http.get(url);
  print(response.body);
}


class Images extends StatelessWidget {
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
                    child: Text('click here',
                    style: TextStyle(
                      color: Colors.white
                    ),
                  )
                ),
              ],
            ),
          ),
    );
  }
}