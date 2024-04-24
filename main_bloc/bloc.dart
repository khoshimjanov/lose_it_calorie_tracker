import 'package:flutter_bloc/flutter_bloc.dart';

class Model extends Cubit<int> {
  Model() : super(0);
  int e = 0;
  void upgrade() {
    e += 1;
    emit(e);
  }

  void downgrade() {
    if (e == 0) return;
    e -= 1;
    emit(e);
  }
}
