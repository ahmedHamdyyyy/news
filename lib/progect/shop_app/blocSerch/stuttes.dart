import 'package:neww/progect/shop_app/model/SerchModel.dart';

abstract class ShopSearchStutes{}
class ShopShearchInatialStute extends ShopSearchStutes{}
class ShopLodingSearchStatus extends ShopSearchStutes{}
class ShopShearchSaccessStute extends ShopSearchStutes{
  final SearchModel searchModel;

  ShopShearchSaccessStute(this.searchModel);
}
class ShopErrorSearchStatus extends ShopSearchStutes{}