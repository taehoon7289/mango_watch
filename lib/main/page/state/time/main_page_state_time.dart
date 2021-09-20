import 'dart:async';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mango_watch/main/page/main_page.dart';
import 'package:mango_watch/page_view/page_view_1.dart';
import 'package:mango_watch/page_view/page_view_2.dart';

class MainPageStateTime extends State<MainPage> {
  final List<String> _dayOfWeeks = ['월', '화', '수', '목', '금', '토', '일'];
  String? _timeNowFormat;
  Timer? _timer;

  void digitalView(DateTime nowDateTime) {
    String amOrPm = nowDateTime.hour >= 12 ? '오후' : '오전';
    String dayOfWeekString = this._dayOfWeeks[nowDateTime.weekday - 1];
    this._timeNowFormat = formatDate(nowDateTime, [
      yyyy,
      '-',
      mm,
      '-',
      dd,
      ' ',
      '$dayOfWeekString',
      '\n',
      '$amOrPm',
      ' ',
      hh,
      ':',
      nn,
      ':',
      ss,
      ':',
      SSS
    ]);
  }

  void analogView(DateTime nowDateTime) {}

  void setInterval() {
    setState(() {
      DateTime nowDateTime = DateTime.now();
      this.digitalView(nowDateTime);
      this.analogView(nowDateTime);
    });
  }

  @override
  initState() {
    super.initState();
    if (_timer == null) {
      _timer = Timer.periodic(Duration(milliseconds: 5), (timer) {
        this.setInterval();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '$_timeNowFormat',
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
            ),
            ListTile(
              title: Text('페이지뷰1로 가기'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageView1()));
              },
            ),
            ListTile(
              title: Text('페이지뷰2로 가기'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageView2()));
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: setInterval,
          tooltip: 'update',
          child: const Icon(Icons.add),
        ));
  }
}
