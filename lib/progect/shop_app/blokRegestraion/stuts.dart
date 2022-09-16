
import 'package:neww/progect/shop_app/model/model_ShopAPP.dart';

abstract class shopRegestStutes{}
class ShopRegestInitialStates extends shopRegestStutes{}
class ShopRegestlodingStates extends shopRegestStutes{}
class ShopRegestSuccessStates extends shopRegestStutes{
  final ShopLogintModel RegestModel;

  ShopRegestSuccessStates(this.RegestModel);
}
class ShopRegestErrorStates extends shopRegestStutes
{
  final String error;

  ShopRegestErrorStates(this.error);
}
class ShopchangedPasswordStatesREGES extends shopRegestStutes{}
