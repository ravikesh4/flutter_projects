import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Screen'),
      ),
      body: SafeArea(child: TheGridView().build()),
    );
  }

}


class TheGridView {
  Card makeGridCell(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: [
          Center(child: Icon(icon),),
          Text(name),
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
      primary: true,
      padding: EdgeInsets.all(1.0),
      crossAxisCount: 2,
      childAspectRatio: 1.0,
      mainAxisSpacing: 1.0,
      crossAxisSpacing: 1.0,
      children: [
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
        makeGridCell("Home", Icons.home),
      ],
    );
  }
}

