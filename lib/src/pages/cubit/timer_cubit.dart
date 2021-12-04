import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import '../../utils/text_blanks.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  Timer? _timer;
  final int _waitTimeInSec;
  int _currentWaitTimeInSec;
  double _percent;
  String _timeStr;
  String _text;
  int _counter = 0;

  TimerCubit({required int waitTimeInSec})
      : _waitTimeInSec = waitTimeInSec,
        _currentWaitTimeInSec = waitTimeInSec,
        _percent = 1,
        _timeStr = "${waitTimeInSec ~/ 60}".padLeft(2, '0') +":"+"${waitTimeInSec % 60}".padLeft(2, '0'),
        _text = '',
        super(TimerInitial("${waitTimeInSec ~/ 60}".padLeft(2, '0') +":"+"${waitTimeInSec % 60}".padLeft(2, '0'), 1));



  Future<void> startTimer() async{
    emit(TimerRunState(_timeStr, _percent, _waitTimeInSec, _text));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_currentWaitTimeInSec%10 == 0 && _currentWaitTimeInSec != 0) {
        if (_waitTimeInSec == 60) {
          _text = oneMinuteTextList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 180) {
          _text = threeMinuteTextList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 300) {
      _text = fiveMinuteTextList[_counter];
      _counter ++;
      print(_text);
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
        emit(TimerInitial(_timeStr, 1));
      }
    });

  }

  Future<void> startToningTimer() async{
    emit(TimerToningRunState(_timeStr, _percent, _waitTimeInSec, _text));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_currentWaitTimeInSec%10 == 0 && _currentWaitTimeInSec != 0) {
        if (_waitTimeInSec == 60) {
          _text = oneMinuteTextToningList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 180) {
          _text = threeMinuteTextToningList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 300) {
          _text = fiveMinuteTextToningList[_counter];
          _counter ++;
          print(_text);
        }
      }
      _currentWaitTimeInSec -= 1;
      _percent = _currentWaitTimeInSec / _waitTimeInSec;
      _timeStr = await calculationTime();
      emit(TimerToningRunState(_timeStr, _percent, _waitTimeInSec, _text));
      if (_currentWaitTimeInSec < 0) {
        _text = '';
        _counter = 0;
        _currentWaitTimeInSec = _waitTimeInSec;
        _percent = 1;
        _timeStr = await calculationTime();
        _timer?.cancel();
        emit(TimerInitial(_timeStr, 1));
      }
    });

  }

  Future<void> startHardeningTimer() async{
    emit(TimerHardeningRunState(_timeStr, _percent, _waitTimeInSec, _text));
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
      if (_currentWaitTimeInSec%10 == 0 && _currentWaitTimeInSec != 0) {
        if (_waitTimeInSec == 60) {
          _text = oneMinuteTextHardeningList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 180) {
          _text = threeMinuteTextHardeningList[_counter];
          _counter ++;
          print(_text);
        }
        if (_waitTimeInSec == 300) {
          _text = fiveMinuteTextHardeningList[_counter];
          _counter ++;
          print(_text);
        }
      }
      _currentWaitTimeInSec -= 1;
      _percent = _currentWaitTimeInSec / _waitTimeInSec;
      _timeStr = await calculationTime();
      emit(TimerHardeningRunState(_timeStr, _percent, _waitTimeInSec, _text));
      if (_currentWaitTimeInSec < 0) {
        _text = '';
        _counter = 0;
        _currentWaitTimeInSec = _waitTimeInSec;
        _percent = 1;
        _timeStr = await calculationTime();
        _timer?.cancel();
        emit(TimerInitial(_timeStr, 1));
      }
    });

  }

  Future<void> restartTimer() async {
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

