import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_testing/bloc/counter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<CounterBloc>().add(GetCounterValue()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(
          builder: (context) {
            return Row(
              children: [
                IconButton(
                  onPressed: () => context.read<CounterBloc>().add(Increment()),
                  icon: const Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () => context.read<CounterBloc>().add(Decrement()),
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text("Counter App")
              ],
            );
          },
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            if (state is CounterUpdating) {
              return const CircularProgressIndicator();
            } else if (state is CounterUpdated) {
              return Text("counter value is : " + state.counter.toString());
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
