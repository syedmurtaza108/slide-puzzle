import 'package:bloc/bloc.dart';

class TempCubit extends Cubit<int> {
  TempCubit() : super(0);

  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}
