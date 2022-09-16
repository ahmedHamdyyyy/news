import 'package:neww/progect/shop_app/model/changVariblModel.dart';
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';

abstract class Shop_Stutes{
}
class InitalShopApp extends Shop_Stutes{}
class BouttomNAVShopApp extends Shop_Stutes{}
class ShopLodingHomeModelStates extends Shop_Stutes{}
class ShopSaccessHomeModelStates extends Shop_Stutes{}
class ShopErrorHomeModelStates extends Shop_Stutes{}
class ShopSaccessCategoriesModelStates extends Shop_Stutes{}
class ShopErrorCategoriesModelStates extends Shop_Stutes{}
class ChangeFavModelStates extends Shop_Stutes{}
class ChangeSaccessFavModelStates extends Shop_Stutes{

 final ChangeFavouriteModel changeFavouriteModel;

  ChangeSaccessFavModelStates(this.changeFavouriteModel);
}
class getChangeFavModelStates extends Shop_Stutes{}
class getChangeFavErrorModelStates extends Shop_Stutes{}
class ChangeFavErrorModelStates extends Shop_Stutes{}
class getLoudingChangeFavModelStates extends Shop_Stutes{}
class getChangeuserModelStates extends Shop_Stutes{
 final ShopLogintModel? shopLoginModel;
  getChangeuserModelStates(this.shopLoginModel);
}
class getChangeuserSacceedModelStates extends Shop_Stutes{}
class getChangeuserErrorModelStates extends Shop_Stutes{}


class UpdituserDataLODINGStates extends Shop_Stutes{}

class UpdituserDataSccesseStates extends Shop_Stutes{
 final ShopLogintModel? shopLoginModel;
 UpdituserDataSccesseStates(this.shopLoginModel);
}


class UpdituserDataERRORStates extends Shop_Stutes{}


