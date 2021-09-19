import 'package:flutter/material.dart';
import 'package:mango_watch/main/page/state/time/main_page_state_time.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => MainPageStateTime();
}
