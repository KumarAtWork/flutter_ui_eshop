import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_ui_kit/Search/search.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './auth/auth.dart';
import './blocks/auth_block.dart';
import './cart.dart';
import './categorise.dart';
import './app_loader.dart';
import './localizations.dart';
import './product_detail.dart';
import './settings.dart';
import './shop/shop.dart';
import './wishlist.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final Locale locale = Locale('en');
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider<AuthBlock>(create: (_) => AuthBlock())],
    child: MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.amber.shade900,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              // This will be applied to the "back" icon
              iconTheme: IconThemeData(color: Colors.black),
              // This will be applied to the action icon buttons that locates on the right side
              actionsIconTheme: IconThemeData(color: Colors.black),
              centerTitle: false,
              elevation: 5,
              titleTextStyle: TextStyle(color: Colors.black))),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => AppLoader(),
        '/auth': (BuildContext context) => Auth(),
        '/shop': (BuildContext context) => Shop(),
        '/categorise': (BuildContext context) => Categorise(),
        '/wishlist': (BuildContext context) => WishList(),
        '/cart': (BuildContext context) => CartList(),
        '/settings': (BuildContext context) => Settings(),
        '/products': (BuildContext context) => Products(),
        '/search': (BuildContext context) => Search()
      },
    ),
  ));
}
