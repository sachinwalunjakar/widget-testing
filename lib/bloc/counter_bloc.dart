import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:widget_testing/repository/counter_respository.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterRepository counterRepository;

  CounterBloc(this.counterRepository) : super(CounterInitial()) {
    on<Increment>(increaseCounterValue);
    on<Decrement>(decreaseCounterValue);
    on<GetCounterValue>(getCounterValue);
  }

  FutureOr<void> increaseCounterValue(
      Increment event, Emitter<CounterState> emit) async {
    emit(CounterUpdating());
    int counter = await counterRepository.increaseCounterValue();
    emit(CounterUpdated(counter));
  }

  FutureOr<void> decreaseCounterValue(
      Decrement event, Emitter<CounterState> emit) async {
    emit(CounterUpdating());
    int counter = await counterRepository.decreaseCounterValue();
    emit(CounterUpdated(counter));
  }

  FutureOr<void> getCounterValue(
      GetCounterValue event, Emitter<CounterState> emit) async {
    emit(CounterUpdating());
    int counter = await counterRepository.getCounterValue();
    emit(CounterUpdated(counter));
  }
}
