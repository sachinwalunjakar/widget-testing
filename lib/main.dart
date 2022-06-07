import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_testing/bloc/counter_bloc.dart';
import 'package:widget_testing/repository/counter_respository.dart';
import 'package:widget_testing/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RepositoryProvider(
        create: (context) => CounterRepository(),
        child: BlocProvider(
          create: (context) => CounterBloc(context.read<CounterRepository>()),
          child: const HomePage(),
        ),
      ),
    );
  }
}
