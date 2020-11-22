
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StreamController<Photo> streamController;
  List<Photo> list = [];

  @override
  void initState() {
    // TODO: implement initState
    streamController = StreamController.broadcast();

    streamController.stream.listen((event) {
      setState(() {
        list.add(event);
      });
    });

    load(streamController);
    super.initState();
  }

  load(StreamController sc) async {
    String url = "https://jsonplaceholder.typicode.com/photos";
    var client = http.Client();

    var req = http.Request('get', Uri.parse(url));

    var streamedRes = await client.send(req);

    streamedRes.stream
      .transform(Utf8Decoder())
      .transform(json.decoder)
    .expand((element) => element)
    .map((map) => Photo.fromJsonMap(map))
    .pipe(streamController);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    streamController?.close();
    streamController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo Streams"),
      ),
      body: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => _makeElement(index),
        ),
      ),
    );
  }

  Widget _makeElement(int index) {
    if ( index >= list.length) {
      return null;
    }

    return Container(
      height: 200,
      width: 200,
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Container(
              height: 190,
              child: Image.network(list[index].url, scale: 0.5)),
          Text(list[index].title),
        ],
      ),
    );
  }
}


class Photo {
  final String title;
  final String url;

  Photo(this.title, this.url);

  Photo.fromJsonMap(Map map) : title = map['title'],
                                url = map['url'];
}