
import 'package:ecommerce_app/LoginScreen/Cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Network/dio_helper.dart';
import '../../Network/end_points.dart';
import '../models/login_model.dart';
class ShopLoginCubit extends Cubit<ShoppingLoginStates> {
  ShopLoginCubit() : super(ShoppingLoginInitial());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? shopLoginModel;
  void useLogin({
    @required String? email,
    @required String? password
  })  {
    emit(ShoppingLoginLoading());
      DioHelper.postData(url: LOGIN, data: {
        'email': email,
        'password': password,
      }).then((value) {
   shopLoginModel=  ShopLoginModel.fromJson(value.data);
   print(shopLoginModel!.data!.token);
   print(shopLoginModel!.data!.token);

   emit(ShoppingLoginSuccess(shopLoginModel!));

      }).catchError((error){
        print(error.toString());
        emit(ShoppingLoginError(error.toString()));

      });

  }
    }

