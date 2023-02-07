import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../AccountScreen/accountScreen.dart';
import '../CartScreen/cartScreen.dart';
import '../ExploreScreen/exploreScreen.dart';
import '../FavouriteScreen/favouriteScreen.dart';
import '../HomeScreen/Cubit/cubit.dart';
import '../HomeScreen/Cubit/states.dart';
import '../HomeScreen/homeScreen.dart';
class AllScreens extends StatefulWidget {
  const AllScreens({Key? key}) : super(key: key);

  @override
  State<AllScreens> createState() => _AllScreensState();
}
class _AllScreensState extends State<AllScreens> {
  int currentIndex=0;
  List<Widget> screens=[HomeScreen(),ExploreScreen(),CartScreen(),FavouriteScreen(),AccountScreen()];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
        create: (BuildContext context) => ShopHomeCubit()..getHomeData()..getCategoriesData()..getFavorites(args),
       child:
        BlocConsumer<ShopHomeCubit, ShopStates>(
        listener: (context,state){},
    builder: (context, state) {
    if (ShopHomeCubit
        .get(context)
        .homeModel != null && ShopHomeCubit
        .get(context)
        .categoriesModel != null) {
      return Scaffold(
        body: screens[currentIndex], bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          currentIndex = index;
          setState(() {

          });
        },
        currentIndex: currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.shop_2,), label: 'Shop'),
          BottomNavigationBarItem(
              icon: Icon(Icons.travel_explore), label: 'Explore'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity), label: 'Account'),


        ],),
      );
    }
    else {
      return Center(child: CircularProgressIndicator());
    }
    } )
    );
  }
}

