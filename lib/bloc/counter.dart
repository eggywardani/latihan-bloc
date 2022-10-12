import 'package:bloc/bloc.dart';

class Counter extends Cubit<int> {
  Counter() : super(0);

  void add() => emit(state + 1);
  void minus() => emit(state - 1);
}
