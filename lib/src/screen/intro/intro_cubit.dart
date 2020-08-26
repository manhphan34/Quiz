import 'package:flutter_bloc/flutter_bloc.dart';

class IntroCubit extends Cubit<String>{
  IntroCubit(state) : super("");

  void statusTwo() => emit("Khám phá các kỳ quan vĩ đại trên thế giới");
  void statusThree() => emit("Tìm hiểu những điều thú vị của tự nhiên");
  void statusFour() => emit("Giải mã những bí mật của vũ trụ huyền bí");
}