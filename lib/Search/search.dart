import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search for brands & products'),
          ),
          actions: [Icon(Icons.camera_alt_outlined)],
        ),
        body: Center(
          child: Text('Search items'),
        ));
  }
}
