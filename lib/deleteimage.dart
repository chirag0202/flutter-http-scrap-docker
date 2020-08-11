import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

webdeli(cmd) async {
  var url = "http://192.168.99.101/cgi-bin/webdelimage.py?w=$cmd";
  var response = await http.get(url);
  print(response.body);
}


class DeleteImage extends StatelessWidget {
  String iname;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
          title: Text('Delete Image',
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
                Divider(height: 8),
                FlatButton(
                    onPressed: () {
                      webdeli(iname,);
                      // print(cmd);
                    },
                    color: Colors.black,
                    child: Text('click here',
                    style: TextStyle(
                      color: Colors.white
                    ),)
                ),
              ],
            ),
          ),
    );
  }
}