import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mango_watch/main/page/main_page.dart';
import 'package:timer_builder/timer_builder.dart';

class MainPageStateTime extends State<MainPage> {
  int _dayOfWeekIndex = 0;
  final List<String> _dayOfWeeks = ['월', '화', '수', '목', '금', '토', '일'];
  String _dayOfWeek = '';
  String _timeNow =
      formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ':', SSS, ' ', am]);

  MainPageStateTime() {
    this._dayOfWeek = this._dayOfWeeks[this._dayOfWeekIndex];
  }

  void _updateDayOfWeek() {
    setState(() {
      if (_dayOfWeekIndex < _dayOfWeeks.length - 1) {
        _dayOfWeekIndex++;
      } else {
        _dayOfWeekIndex = 0;
      }
      _dayOfWeek = _dayOfWeeks[_dayOfWeekIndex];
    });
  }

  void _updateTimeNow() {
    _timeNow =
        formatDate(DateTime.now(), [hh, ':', nn, ':', ss, ':', SSS, ' ', am]);
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
            TimerBuilder.periodic(
              const Duration(milliseconds: 10),
              builder: (context) {
                return Text(
                  '$_timeNow',
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _updateDayOfWeek,
          tooltip: 'update',
          child: const Icon(Icons.add),
        ));
  }
}
