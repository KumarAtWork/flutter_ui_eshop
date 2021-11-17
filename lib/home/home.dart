import 'package:flutter/material.dart';
import '../custom-icons/wishlist_icons.dart';
import '../models/popular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'categories.dart';
import './drawer.dart';

class Home extends StatelessWidget {
  final List<Popular> imgList = [
    Popular(
        title: '15% off',
        imgUrl:
            'https://assets.myntassets.com/f_webp,w_196,c_limit,fl_progressive,dpr_2.0/assets/images/retaillabs/2021/11/15/ce58922b-29b3-4293-a8f0-b53f7ae051561636941813555-Extra-15--Off.jpg'),
    Popular(
        title: '40-70% off',
        imgUrl:
            'https://assets.myntassets.com/f_webp,w_196,c_limit,fl_progressive,dpr_2.0/assets/images/2021/11/14/7b972292-8065-4d53-9b79-75e3d34d2bbe1636879256987-Sweatshirts-_-Jackets.jpg'),
    Popular(
        title: 'urbanic',
        imgUrl:
            'https://assets.myntassets.com/f_webp,w_196,c_limit,fl_progressive,dpr_2.0/assets/images/2021/11/14/072b09bf-a776-4179-b210-62b5c56391011636879257003-Trendiest-Styles.jpg'),
    Popular(
        title: 'myntra unique',
        imgUrl:
            'https://assets.myntassets.com/f_webp,w_196,c_limit,fl_progressive,dpr_2.0/assets/images/2021/11/14/20b40b95-79e0-4102-b771-3b266fc9be431636879256995-Sweatshirts-_-Jackets_2.jpg'),
    Popular(
        title: 'kid store',
        imgUrl:
            'https://assets.myntassets.com/f_webp,w_196,c_limit,fl_progressive,dpr_2.0/assets/images/2021/11/14/92b20a0c-4f8c-4e5c-81f3-bfc2a7e1cec01636879257010-T-Shirts-_-Tops.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            top: true,
            left: false,
            right: false,
            child: CustomScrollView(slivers: <Widget>[
              SliverAppBar(
                pinned: false,
                // Allows the user to reveal the app bar if they begin scrolling
                // back up the list of items.
                floating: true,
                snap: false,
                // Display a placeholder widget to visualize the shrinking size.
                flexibleSpace: Categories(),
                // Make the initial height of the SliverAppBar larger than normal.
                expandedHeight: 80,
              ),
              SliverList(
                // Use a delegate to build items as they're scrolled on screen.
                delegate: SliverChildBuilderDelegate(
                  // The builder function returns a ListTile with a title that
                  // displays the index of the current item.
                  (context, index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: Padding(
                        padding: EdgeInsets.only(
                            top: 4.0, left: 8.0, right: 8.0, bottom: 4.0),
                        child: CachedNetworkImage(
                            width: double.infinity,
                            height: 180,
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://assets.myntassets.com/f_webp,w_980,c_limit,fl_progressive,dpr_2.0/assets/images/2021/11/14/83c153e7-3662-4b95-bf32-ca7feff012b21636877209860-HRX_Desk.jpg'),
                      )),
                      Padding(
                        padding:
                            EdgeInsets.only(top: 14.0, left: 8.0, right: 8.0),
                        child: Text('BEST OFFERS',
                            // AppLocalizations.of(context)!
                            //         .translate('POPULAR') ??
                            //     '',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w700)),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 8.0),
                        height: 159.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: imgList.map((p) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 120.0,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                            context, '/products',
                                            arguments: p.title);
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(
                                            height: 150,
                                            child: Hero(
                                              tag: p.title,
                                              child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: p.imgUrl,
                                                placeholder: (context, url) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        new Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 6.0, left: 8.0, right: 8.0),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-1.png'),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(
                                top: 8.0, left: 8.0, right: 8.0),
                            child: Text('Shop By Category',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 8.0, top: 8.0, left: 8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Theme.of(context).primaryColor),
                                child: Text('View All',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  Navigator.pushNamed(context, '/categorise');
                                }),
                          )
                        ],
                      ),
                      Container(
                        child: GridView.count(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          padding: EdgeInsets.only(
                              top: 8, left: 6, right: 6, bottom: 12),
                          children: List.generate(4, (index) {
                            return Container(
                              child: Card(
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    print('Card tapped.');
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                        height:
                                            (MediaQuery.of(context).size.width /
                                                    2) -
                                                70,
                                        width: double.infinity,
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: imgList[index].imgUrl,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              new Icon(Icons.error),
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                        imgList[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: 6.0, left: 8.0, right: 8.0, bottom: 20),
                          child: Image(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/banner-2.png'),
                          ),
                        ),
                      ),
                      Container(
                        child: Text('data'),
                      )
                    ],
                  ),
                  // Builds 1000 ListTiles
                  childCount: 1,
                ),
              ),
            ])));
  }
}
