

import 'package:ecommerce_app/HomeScreen/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../FavouriteScreen/models/change_favorite_model.dart';
import '../../FavouriteScreen/models/get_favorites_model.dart';
import '../../Network/dio_helper.dart';
import '../../Network/end_points.dart';
import '../models/categories_home_model.dart';
import '../models/home_model.dart';

class ShopHomeCubit extends Cubit<ShopStates>
{
  ShopHomeCubit():super(ShopInintialState());

  static ShopHomeCubit get(context) => BlocProvider.of(context);
 // List<Widget> screens=[HomeScreen(),ExploreScreen(),CartScreen(),FavouriteScreen(),AccountScreen()];

  HomeModel? homeModel;

  Map<int?,bool?>favourites={};
  void getHomeData()

  {
    emit(ShopLoadingHomeDataState());
     DioHelper.getData(url: HOME,).then((value){
       homeModel=HomeModel.fromJson(value.data);
       homeModel!.data!.products.forEach((element) {
         favourites.addAll({
           element.id:element.inFavourites
         });
       });
       emit(ShopSuccessHomeDataState(homeModel: homeModel!));


       print(favourites.toString());

     }).catchError((onError){
       print(onError.toString());
       emit(ShopErrorHomeDataState('onError'));
     });
  }
  CategoriesModel? categoriesModel;
  void getCategoriesData()
  {
    DioHelper.getData(url: CATEGORIES,).then((value){
      categoriesModel=CategoriesModel.fromJson(value.data);
    //  print(categoriesModel!.data!.categories[0].image);
      emit(ShopSuccessCategoriesData(categoriesModel: categoriesModel));
  }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorCategoriesData('onError'));
  });

  }
  ChangeFavoriteModel? changeFavoriteModel;
  void changeFavorites(int productId,String token)
  {
     favourites![productId]= !favourites[productId]!;//true
     emit(ShopChangeFavorites());

     DioHelper.postData(url: FAVORITES, data: {
      "product_id":productId
    },token: token).then((value) {
      changeFavoriteModel=ChangeFavoriteModel.fromJson(value.data);
     if(!changeFavoriteModel!.status!)
      {
         favourites[productId]= !favourites[productId]!;
       }else{
       getFavorites(token);
     }
      print(value.data);
      emit(ShopSuccessChangeFavorites());
    }).catchError((onError){
       favourites[productId]= !favourites[productId]!;

       emit(ShopErrorChangeFavorites('error'));
    });
  }

  GetFavoritesModel? getFavoritesModel;
  void getFavorites(String token){
    emit(ShopLoadingFavoritesData());
    DioHelper.getData(url: FAVORITES,token:token ).
    then((value){
      getFavoritesModel=GetFavoritesModel.fromJson(value.data);
      //print(getFavoritesModel!.data!.data[0].id);
      emit(ShopSuccessFavoritesData(getFavoritesModel: getFavoritesModel));
    }).catchError((onError){
      print(onError.toString());
      emit(ShopErrorFavoritesData());
    });
  }

}