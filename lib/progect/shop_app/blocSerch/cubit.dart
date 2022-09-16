
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:neww/mm/NETWORK/END_point.dart';
import 'package:neww/mm/local/dio.dart';
import 'package:neww/progect/shop_app/blocSerch/stuttes.dart';
import 'package:neww/progect/shop_app/model/SerchModel.dart';


class SearchCubit extends Cubit<ShopSearchStutes> {
  SearchCubit() : super((ShopShearchInatialStute()));

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void getSearchData(String searchText) {
    emit(ShopLodingSearchStatus());
    Diohlper.postDataa(url: serch,
        token: token,
        data: {
      'text': '$searchText',
    }).then((value) {
      searchModel = SearchModel.fromJson(value.data);

      emit(ShopShearchSaccessStute(searchModel!));
    }).catchError((error) {
      emit(ShopErrorSearchStatus());

    });
  }
}