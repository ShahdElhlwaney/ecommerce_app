

import '../models/login_model.dart';

abstract class ShoppingLoginStates{}
class ShoppingLoginInitial extends ShoppingLoginStates{}
class ShoppingLoginLoading extends ShoppingLoginStates{}
class ShoppingLoginSuccess extends ShoppingLoginStates{
  ShopLoginModel shopLoginModel;
  ShoppingLoginSuccess(this.shopLoginModel);
}
class ShoppingLoginError extends ShoppingLoginStates{
  final String error;
  ShoppingLoginError(this.error);

}