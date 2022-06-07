import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:widget_testing/bloc/counter_bloc.dart';
import 'package:widget_testing/repository/counter_respository.dart';
import 'package:widget_testing/home_page.dart';

// mocking repository
class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late MockCounterRepository mockCounterRepository;
  late int counter;

  setUp(() {
    mockCounterRepository = MockCounterRepository();
    counter = 0;
  });

  void arrangeCounterRepositoryForMocking() {
    //mocking class fields
    when(() => mockCounterRepository.counter).thenReturn(counter);
    //mocking class functions
    when(() => mockCounterRepository.getCounterValue()) .thenAnswer((_) async => counter);
    when(() => mockCounterRepository.increaseCounterValue()) .thenAnswer((_) async => ++counter);
    when(() => mockCounterRepository.decreaseCounterValue()) .thenAnswer((_) async => --counter);
  }

  Widget createWidgetUnderTest() {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => CounterBloc(mockCounterRepository),
        child: const HomePage(),
      ),
    );
  }

  testWidgets("inital value of counter is 0", (WidgetTester tester) async {
    // arrange
    arrangeCounterRepositoryForMocking();
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // assert
    expect(find.text("counter value is : 0"), findsOneWidget);
  });

  testWidgets("counter value increase on clicking minus button", (WidgetTester tester) async {
    // arrange
    arrangeCounterRepositoryForMocking();
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // act
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // assert
    expect(find.text("counter value is : 1"), findsOneWidget);
  });

  testWidgets("counter value decrease on clicking minus button", (WidgetTester tester) async {
    // arrange
    arrangeCounterRepositoryForMocking();
    await tester.pumpWidget(createWidgetUnderTest());
    await tester.pump();

    // act
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();

    // assert
    expect(find.text("counter value is : -1"), findsOneWidget);
  });
}
