import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class StarWarData extends StatefulWidget {
  @override
  _StarWarDataState createState() => _StarWarDataState();
}

class _StarWarDataState extends State<StarWarData> {
  final String url = "https://swapi.dev/api/starships";
  List data;

  Future<String> getSWData() async {
    var res = await http.get(url, headers: {
      "Accept": "application/json"
    });

    setState(() {
      var resBody = json.decode(res.body);
      data = resBody["results"];
    });

    return "Success!";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSWData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Start War Starship"),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context,int index) {
          return Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Name: ${data[index]["name"]}",
                        style: TextStyle(fontSize: 18.0,
                        color: Colors.black54,
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Model: ${data[index]["model"]}",
                        style: TextStyle(fontSize: 18.0,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
