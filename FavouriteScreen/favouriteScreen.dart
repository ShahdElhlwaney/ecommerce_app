
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../GeneralComponents/ButtonComponent.dart';
import '../GeneralComponents/TextComponent.dart';
import '../HomeScreen/Cubit/cubit.dart';
import '../HomeScreen/Cubit/states.dart';
import 'FavouriteProduct.dart';
class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<ShopHomeCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(85.0), // here the desired height
            child: AppBar(
              backgroundColor: Colors.white,
              title: TextComponent(text: 'Favorurite',color: Colors.black,fontWeight: FontWeight.bold,fontSize: 25,),
              centerTitle: true,
            ),
          ),
          body: Column(
            mainAxisSize:MainAxisSize.max ,
            children: [
              Expanded(
                child: ListView(
                  children: [
                    for(var i=0;i<ShopHomeCubit.get(context).getFavoritesModel!.data!.data.length;i++)
                      FavouriteProduct(product:ShopHomeCubit.get(context).getFavoritesModel!.data!.data[i].product!),

                  ],
                ),
              ),
              SizedBox(height: 25,),
              Button(text: 'Add All To Cart',top: 0,),
              SizedBox(height: 20,),

            ],
          ),
        );
      },
    );
  }
}
