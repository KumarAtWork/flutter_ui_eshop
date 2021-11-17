import 'package:flutter/material.dart';

class HomeTabIcon extends StatefulWidget {
  final IconData icon;
  final Color color;
  const HomeTabIcon(this.icon, {this.color = Colors.grey});
  @override
  _HomeTabIconState createState() => _HomeTabIconState();
}

class _HomeTabIconState extends State<HomeTabIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Icon(
      widget.icon,
      color: widget.color,
      size: 20.0,
    ));
  }
}
