part of 'timer_cubit.dart';

@immutable
abstract class TimerState {}

class TimerInitial extends TimerState {
  final String waitTime;
  final double percent;

  TimerInitial(this.waitTime, this.percent);
}

class TimerRunState extends TimerState {
  final String currentTime;
  final double percent;
  final int waitTime;
  final String text;

  TimerRunState( this.currentTime,this.percent, this.waitTime, this.text);
}

class TimerToningRunState extends TimerState {
  final String currentTime;
  final double percent;
  final int waitTime;
  final String text;

  TimerToningRunState( this.currentTime,this.percent, this.waitTime, this.text);
}


class TimerHardeningRunState extends TimerState {
  final String currentTime;
  final double percent;
  final int waitTime;
  final String text;

  TimerHardeningRunState( this.currentTime,this.percent, this.waitTime, this.text);
}

class TimerPauseState extends TimerState {
  final String currentTime;
  final double percent;

  TimerPauseState(this.currentTime, this.percent);
}