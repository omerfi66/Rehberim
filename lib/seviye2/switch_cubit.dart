import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchCubit extends Cubit<bool> {
  SwitchCubit() : super(false);

  durumDegirstir() {
    emit(!state); // state den onceki unlem degeri tersine cevir demek
  }
}
