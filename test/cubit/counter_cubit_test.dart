import 'package:awesome_counter_app/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Counter Cubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });

    test('The initial state for CounterCubit is CounterState(counterValue:0)',
        () {
      expect(
          counterCubit.state,
          const CounterState(
            counterValue: 0,
          ));
    });

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:1),isIncremented:true when cubit.increment function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.increment(),
      expect: () => [const CounterState(counterValue: 1, isIncremented: true)],
    );

    blocTest<CounterCubit, CounterState>(
      'the cubit should emit a CounterState(counterValue:-1),isIncremented:false when cubit.decrement function is called',
      build: () => CounterCubit(),
      act: (cubit) => cubit.decrement(),
      expect: () =>
          [const CounterState(counterValue: -1, isIncremented: false)],
    );
  });
}
