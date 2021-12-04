import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../utils/text_blanks.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  final _random = Random(DateTime.now().millisecondsSinceEpoch);
  final int _waitTimeInSec;
  int _currentWaitTimeInSec;
  double _percent;
  String _timeStr;
  String _text;
  int _counter = 0;
  final int mode;
  int index;
  TimerCubit({required int waitTimeInSec, required this.mode})
      : _waitTimeInSec = waitTimeInSec,
        _currentWaitTimeInSec = waitTimeInSec,
        _percent = 1,
        index = -1,
        _timeStr = "${waitTimeInSec ~/ 60}".padLeft(2, '0') +
            ":" +
            "${waitTimeInSec % 60}".padLeft(2, '0'),
        _text = '',
        super(TimerInitial(
            "${waitTimeInSec ~/ 60}".padLeft(2, '0') +
                ":" +
                "${waitTimeInSec % 60}".padLeft(2, '0'),
            1.0,
            mode));

  Future<void> startTimer() async {
    emit(TimerRunState(_timeStr, _percent, _waitTimeInSec, _text));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_currentWaitTimeInSec % 10 == 0 && _currentWaitTimeInSec != 0) {
        index++;
        print("index $index");
        switch (mode) {
          case 1:
            if (_waitTimeInSec == 60) {
              _text = oneMinuteTextList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 180) {
              _text = threeMinuteTextList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 300) {
              _text = fiveMinuteTextList[index];
              _counter++;
              print(_text);
            }
            break;
          case 2:
            if (_waitTimeInSec == 60) {
              _text = oneMinuteTextToningList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 180) {
              _text = threeMinuteTextToningList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 300) {
              _text = fiveMinuteTextToningList[index];
              _counter++;
              print(_text);
            }
            break;
          case 3:
            if (_waitTimeInSec == 60) {
              _text = oneMinuteTextHardeningList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 180) {
              _text = threeMinuteTextHardeningList[index];
              _counter++;
              print(_text);
            }
            if (_waitTimeInSec == 300) {
              _text = fiveMinuteTextHardeningList[index];
              _counter++;
              print(_text);
            }
            break;
        }
      }
      _currentWaitTimeInSec -= 1;
      _percent = _currentWaitTimeInSec / _waitTimeInSec;
      _timeStr = await calculationTime();
      emit(TimerRunState(_timeStr, _percent, _waitTimeInSec, _text));
      if (_currentWaitTimeInSec < 0) {
        _text = '';
        _counter = 0;
        _currentWaitTimeInSec = _waitTimeInSec;
        _percent = 1;
        _timeStr = await calculationTime();
        _timer?.cancel();
        emit(TimerInitial(_timeStr, 1, mode));
      }
    });
  }

  Future<void> restartTimer() async {
    index = -1;
    _text = '';
    _counter = 0;
    _currentWaitTimeInSec = _waitTimeInSec;
    _percent = 1;
    _timeStr = await calculationTime();
    _timer?.cancel();
    emit(TimerRunState(_timeStr, _percent, _waitTimeInSec, _text));
    startTimer();
  }

  Future<void> pauseTimer() async {
    _timer?.cancel();
    emit(TimerPauseState(_timeStr, _percent));
  }

  Future<String> calculationTime() async {
    var minuteStr = (_currentWaitTimeInSec ~/ 60).toString().padLeft(2, '0');
    var secondStr = (_currentWaitTimeInSec % 60).toString().padLeft(2, '0');
    return ("$minuteStr:$secondStr");
  }
}
