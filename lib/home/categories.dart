import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> imgList = [
    "https://images.unsplash.com/photo-1552374196-1ab2a1c593e8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bWVucyUyMGZhc2hpb258ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1515886657613-9f3515b0c78f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8d29tZW5zJTIwZmFzaGlvbnxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1575537302964-96cd47c06b1b?ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8c2hvZXN8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    "https://images.unsplash.com/photo-1596462502278-27bfdc403348?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXR5fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    "https://media.istockphoto.com/photos/kitchenware-and-kitchen-tools-on-the-table-picture-id1341921193?b=1&k=20&m=1341921193&s=170667a&w=0&h=y9ZZ0z9Isx9hxn5WhO9se-rFDHU8be4ajSEfxy9HA1U=",
    "https://images.unsplash.com/photo-1610701596061-2ecf227e85b2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8a2l0Y2hlbndhcmV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=600&q=60",
    "https://media.istockphoto.com/photos/mens-accessories-organized-on-table-in-knolling-arrangement-picture-id638385938?b=1&k=20&m=638385938&s=170667a&w=0&h=XwwYLrr25QjA78p6sHHE9tVjQMsCgTWroUWHSp5bFnQ="
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: imgList
              .map((i) =>
                  CircleAvatar(radius: 34, backgroundImage: NetworkImage(i)))
              .toList()),
    );
  }
}
