
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';

abstract class shopLginStutes{}
class ShopLoginInitialStates extends shopLginStutes{}
class ShopLoginlodingStates extends shopLginStutes{}
class ShopLoginSuccessStates extends shopLginStutes{
  final ShopLogintModel loginModel;

  ShopLoginSuccessStates(this.loginModel);
}
class ShopLoginErrorStates extends shopLginStutes
{
  final String error;

  ShopLoginErrorStates(this.error);
}
class ShopchangedPasswordStates extends shopLginStutes{}
class ChangeIconeStute extends shopLginStutes{}
