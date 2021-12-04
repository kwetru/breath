part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {
  final String waitTime;
  final double percent;
  final int mode;

  TimerInitial(this.waitTime, this.percent, this.mode);
}

class TimerRunState extends TimerState {
  final String currentTime;
  final double percent;
  final int waitTime;
  final String text;

  TimerRunState(this.currentTime, this.percent, this.waitTime, this.text);
}

class TimerPauseState extends TimerState {
  final String currentTime;
  final double percent;

  TimerPauseState(this.currentTime, this.percent);
}
