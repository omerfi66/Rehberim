import 'package:bloccc/seviye1/giris_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GirisCubit extends Cubit<int> {
  GirisCubit() : super(0);
  var repo = GirisRepo();

  // int yeniSayi = state + 1;
  // emit(yeniSayi);
  arttir() => emit(repo.arttir(state));
  azalt() => emit(repo.azalt(state));
}
