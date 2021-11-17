import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/custom-icons/wishlist_icons.dart';
import 'package:flutter_ecommerce_ui_kit/home/drawer.dart';
import './home/home.dart';
import 'package:flutter_ecommerce_ui_kit/tabs/home_tab_icon.dart';

class AppLoader extends StatefulWidget {
  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader> {
  var colors = [Colors.red, Colors.grey, Colors.grey, Colors.grey];
  @override
  Widget build(BuildContext context) {
    List<Widget> _tabs = [
      Tab(child: HomeTabIcon(Icons.home, color: colors[0])),
      Tab(child: HomeTabIcon(Icons.category, color: colors[1])),
      Tab(child: HomeTabIcon(Icons.explore, color: colors[2])),
      Tab(child: HomeTabIcon(Icons.person, color: colors[3])),
    ];
    textStyle() {
      return TextStyle(color: Colors.white, fontSize: 30.0);
    }

    _setTabBar(index) {
      setState(() {
        for (var i = 0; i < colors.length; i++) {
          if (i == index)
            colors[i] = Colors.red;
          else
            colors[i] = Colors.grey;
        }
      });
    }

    return new DefaultTabController(
      length: 4,
      child: Scaffold(
        drawer: Drawer(
          child: AppDrawer(),
        ),
        appBar: AppBar(
          elevation: 2,
          title: Text(
            'Myntra',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(255, 99, 71, 1)),
          ),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  //   Navigator.pop(context);
                  Navigator.pushNamed(context, '/search');
                },
                icon: Icon(Icons.search_outlined)),
            IconButton(
              icon: Icon(Icons.notifications_outlined),
              onPressed: () {},
            ),
            IconButton(onPressed: () {}, icon: Icon(Wishlist.favorite_border)),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {},
            ),
          ],
        ),
        bottomSheet: TabBar(
            tabs: _tabs,
            indicatorColor: Colors.red,
            onTap: (index) => _setTabBar(index)),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            Home(),
            Container(
              color: Colors.blueGrey,
              child: Center(
                child: Text(
                  "Category",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text(
                  "Explore",
                  style: textStyle(),
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              child: Center(
                child: Text(
                  "Profile",
                  style: textStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
