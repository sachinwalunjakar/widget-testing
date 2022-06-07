part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class GetCounterValue extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class Increment extends CounterEvent {
  @override
  List<Object?> get props => [];
}

class Decrement extends CounterEvent {
  @override
  List<Object?> get props => [];
}
