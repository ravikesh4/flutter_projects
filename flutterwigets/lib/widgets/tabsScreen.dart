import 'package:flutter/material.dart';

class Tabscreen extends StatefulWidget {
  @override
  _TabscreenState createState() => _TabscreenState();
}

class _TabscreenState extends State<Tabscreen> with SingleTickerProviderStateMixin {
  
  TabController tabController;
  
  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  
  @override
  void dispose() {
    // TODO: implement dispose
    tabController.dispose();
    super.dispose();
  }
  
  
  TabBar makeTabBar() {
    return TabBar(tabs: <Tab>[
      Tab(
        icon: Icon(Icons.home),
      ),
      Tab(
        icon: Icon(Icons.settings_power),
      ),
    ], controller: tabController, );
  }
  
  TabBarView makeTabBarView(tabs) {
    return TabBarView(children: tabs,
    controller: tabController,
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab Screen '),
        backgroundColor: Colors.blue,
        bottom: makeTabBar(),
      ),
      body: makeTabBarView([
        TheGridView().build(),
        SecondScreen(),
      ]),

    );
  }
}


class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("This is second screen"),
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


