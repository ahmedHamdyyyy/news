
import 'package:flutter/cupertino.dart';
import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/dio.dart';

import 'package:neww/progect/shop_app/Screens/Catigores.dart';
import 'package:neww/progect/shop_app/Screens/fivorets.dart';
import 'package:neww/progect/shop_app/Screens/prodactes.dart';
import 'package:neww/progect/shop_app/Screens/sitting.dart';
import 'package:neww/progect/shop_app/bloc_All_ShopAPP/stutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neww/progect/shop_app/model/Categories_Model.dart';
import 'package:neww/progect/shop_app/model/Home_model.dart';
import 'package:neww/progect/shop_app/model/changVariblModel.dart';
import 'package:neww/progect/shop_app/model/favouretsModel.dart';
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';

class ShopCubit extends Cubit<Shop_Stutes> {
  ShopCubit() : super(InitalShopApp());
  static ShopCubit get(context) => BlocProvider.of(context);

  int CurrentIndex = 0;

  List<String> titles=[

    "البضائع",
    "الفئات",
    "المفضله",
    "الاعدادات",
  ];
  List<Widget> BottumScreenss = [
    ProdactesScreen(),
    catogresScreen(),
    fivoretesScreen(),
    SettingesScreen(),
  ];

  void butttomNavigat(int inddex) {
    CurrentIndex = inddex;
    emit(BouttomNAVShopApp());
  }


  ShopHomeModel? home_model;
  Map<int, bool> favourets = {};

  void getHomeData() {
    emit(ShopLodingHomeModelStates());
    Diohlper.getData(url: HOME, token: token, quiry: {}).then((value) {
      emit(ShopSaccessHomeModelStates());
      home_model = ShopHomeModel.fromjsom(value.data);
      home_model!.data!.products.forEach((element) {
        favourets.addAll({
          element.id: element.infavorites!,
        });
      });
      print(favourets.toString());
    }).catchError((error) {
      emit(ShopErrorHomeModelStates());
    });
  }

  CategoryModel? categoryModel;
  void getCategoriesData() {
    Diohlper.getData(
      url: GET_CATIOGRIS,
      token: token,
    ).then((value) {
      emit(ShopSaccessCategoriesModelStates());
      categoryModel = CategoryModel.formjson(value.data);
      /*print(home_model.toString());
      print(home_model?.status);*/
    }).catchError((error) {
      emit(ShopErrorCategoriesModelStates());
    });
  }

  ChangeFavouriteModel? changeFavouriteModel;
  void ChangeFavouretsData(int ProdacutId) {
    if (favourets[ProdacutId] == true) {
      favourets[ProdacutId] = false;
    } else {
      favourets[ProdacutId] = true;
    }

    emit(ChangeFavModelStates());
    Diohlper.postDataa(
      url: FAVOURETS,
      token: token,
      data: {
        "product_id": ProdacutId,
      },
    ).then((value) {
      changeFavouriteModel = ChangeFavouriteModel.fromjson(value.data);
      emit(ChangeSaccessFavModelStates(changeFavouriteModel!));
     // print(value.data);

      emit(ChangeFavErrorModelStates());
      getChangeFavouretsData();
    }).catchError((e) {});
  }

  GetFavoyriteData? getFavoyriteData;
  void getChangeFavouretsData() {
    emit(getLoudingChangeFavModelStates());
    Diohlper.getData(
      url: FAVOURETS,
      token: token,
    ).then((value) {
      getFavoyriteData = GetFavoyriteData.fromJson(value.data);
     // print(value.data);
      /* ShowToast(text:changeFavouriteModel!.message!, stute: ToustStute.ERROR);
      if(changeFavouriteModel!.status==false)
      {
        favourets[ProdacutId]=false;
      }
      else
      {
        favourets[ProdacutId]=true;
      }*/
      emit(getChangeFavModelStates());
    }).catchError((e) {});
  }

  ShopLogintModel? loginModel;
  void getUserData() {
    emit( getChangeuserModelStates(loginModel));
    Diohlper.getData(
      url: PROFIL,
      token: token,
    ).then((value) {
      loginModel = ShopLogintModel.fromJson(value.data);


      //print(value.data);
      emit(getChangeuserSacceedModelStates());
    }).catchError((e) {
      emit(getChangeuserErrorModelStates());
    });
  }


  void upditUserData({
    required String email,
    required String phone,
    required String name,
  }) {
    emit(UpdituserDataLODINGStates());
    Diohlper.putDataa(url: UPDATE,
        token: token,
        data: {
      "email": email,
      "phone": phone,
      "name": name,
    }).then((value) {
      loginModel = ShopLogintModel.fromJson(value.data);
      emit(UpdituserDataSccesseStates(loginModel));
    }).catchError((erroe) {
      print(erroe.toString());
      emit(UpdituserDataERRORStates(

      ));
    });
  }
}
