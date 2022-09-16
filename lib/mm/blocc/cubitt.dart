







import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/mm/blocc/stut.dart';
import 'package:neww/mm/local/cach_helper.dart';


class bloc extends Cubit<appstatus> {
  bloc() : super(appinitialsyatus());

  static bloc get(context) => BlocProvider.of(context);

  bool isDark=false;
  void changAppMode(){
    isDark= !isDark;

    CachHealper.putBoll(value: isDark, key: "dark").then((value) {
      emit(NewsChangeAppMODEE());
    });
  }
}
