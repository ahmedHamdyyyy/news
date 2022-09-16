import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/progect/shop_app/blokLoginshop/stuts.dart';
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';


class ShopLoginCubit extends Cubit<shopLginStutes>
{
  ShopLoginCubit():super (ShopLoginInitialStates());
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  IconData IconSufix= Icons.remove_red_eye_rounded;
  bool isPasswordShow=true;



  bool isLike=true;
   Color colorss=Colors.black;
   void changeLike()
   {
     isLike = !isLike;
     colorss=isLike?Colors.black:Colors.red;
     emit(ChangeIconeStute());
   }


  void changPassoworsVisability()
  {
    isPasswordShow= !isPasswordShow;
    IconSufix=isPasswordShow?Icons.remove_red_eye_rounded:Icons.visibility_off;
    emit(ShopchangedPasswordStates());

  }
  ShopLogintModel? loginModel;
  void userLogin({required String email,required String password})
  {
    emit(ShopLoginlodingStates());
    Diohlper.postDataa(
        url: LOGIN,
        data: {
             "email":email,
             "password":password,
        }).then((value) {
          print(value.data);
          loginModel = ShopLogintModel.fromJson(value.data);
         print(value.data["massage"]);
      emit(ShopLoginSuccessStates(loginModel!));
    }).catchError((erroe)
    {
      print(erroe.toString());
      emit(ShopLoginErrorStates(erroe.toString(),));
    });
  }

}