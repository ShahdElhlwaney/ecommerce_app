
import 'package:flutter/cupertino.dart';

import '../../FavouriteScreen/models/get_favorites_model.dart';
import '../models/categories_home_model.dart';
import '../models/home_model.dart';

abstract class ShopStates{}
class ShopInintialState extends ShopStates{}
class ShopLoadingHomeDataState extends ShopStates{}
class ShopSuccessHomeDataState extends ShopStates{
  HomeModel? homeModel;
  ShopSuccessHomeDataState({@required this.homeModel});

}
class ShopErrorHomeDataState extends ShopStates{
  String error;
  ShopErrorHomeDataState(this.error);
}
class ShopSuccessCategoriesData extends ShopStates{
  CategoriesModel? categoriesModel;
  ShopSuccessCategoriesData({@required this.categoriesModel});
}
class ShopErrorCategoriesData extends ShopStates{
  String error;
  ShopErrorCategoriesData(this.error);
}
class ShopSuccessChangeFavorites extends ShopStates {}
class ShopChangeFavorites extends ShopStates {}

class ShopErrorChangeFavorites extends ShopStates {
  String error;
  ShopErrorChangeFavorites(this.error);
}
class ShopLoadingFavoritesData extends ShopStates{}

class ShopSuccessFavoritesData extends ShopStates{
  GetFavoritesModel? getFavoritesModel;
  ShopSuccessFavoritesData({required this.getFavoritesModel});

}

class ShopErrorFavoritesData extends ShopStates{}
