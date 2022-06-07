part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterUpdating extends CounterState {}

class CounterUpdated extends CounterState {
  final int counter;
  CounterUpdated(this.counter);
}
