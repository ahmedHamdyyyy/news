import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';
import 'package:neww/progect/shop_app/blokRegestraion/stuts.dart';
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';

class ShopRegestCubit extends Cubit<shopRegestStutes> {
  ShopRegestCubit() : super(ShopRegestInitialStates());
  static ShopRegestCubit get(context) => BlocProvider.of(context);
  IconData IconSufix = Icons.remove_red_eye_rounded;
  bool isPasswordShow = true;

  void changPassoworsVisabilityREGEST() {
    isPasswordShow = !isPasswordShow;
    IconSufix =
        isPasswordShow ? Icons.remove_red_eye_rounded : Icons.visibility_off;
    emit(ShopchangedPasswordStatesREGES());
  }

  ShopLogintModel? RegestModel;
  void userLogin({
    required String email,
    required String password,
    required String phone,
    required String name,
  }) {
    emit(ShopRegestlodingStates());
    Diohlper.postDataa(url: REGESTR, data: {
      "email": email,
      "password": password,
      "name": name,
      "phone": phone,
    }).then((value) {
      print(value.data);
      RegestModel = ShopLogintModel.fromJson(value.data);
      //print(value.data["massage"]);
      emit(ShopRegestSuccessStates(RegestModel!));
    }).catchError((erroe) {
      print(erroe.toString());
      emit(ShopRegestErrorStates(
        erroe.toString(),
      ));
    });
  }
}
