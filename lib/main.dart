import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mango_watch/main/page/main_page.dart';
import 'package:mango_watch/page_view/page_view_1.dart';
import 'package:mango_watch/page_view/page_view_2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // String title = WordPair.random().toString();
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        initialRoute: '/',
        routes: {
          '/': (context) => MainPage(title: 'dddd'),
          '/page/1': (context) => PageView1(),
          '/page/2': (context) => PageView2()
        });
  }
}
