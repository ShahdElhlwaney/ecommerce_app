import 'package:flutter/material.dart';
import '../GeneralComponents/ProductComponent.dart';
import '../GeneralComponents/TextComponent.dart';
import '../GeneralComponents/containerComponent.dart';
import '../GeneralComponents/imageComponent.dart';
import 'Components/Category.dart';
import 'Cubit/cubit.dart';
import 'package:carousel_slider/carousel_slider.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as String;


          return Scaffold(
            body: ListView(
              children: [
                Stack(
                  children: [
                    ImageComponent(
                      imageText: 'lib/images/OrangeCarrot2.png',
                      left: 202,
                      top: 58,),
                    ImageComponent(
                        imageText: 'lib/images/orangeCarrot1.png',
                        left: 179,
                        top: 71,
                        width: 37.72),
                    Padding(
                      padding: const EdgeInsets.only(left: 115, top: 134),
                      child: Icon(Icons.ac_unit, color: Color(0xff4C4F4D),),
                    ),
                    TextComponent(text: 'Dhaka, Banassre',
                      top: 135,
                      left: 145,
                      fontSize: 18,
                      color: Color(0xff4C4F4D),),
                    ContainerComponent(width: 370,
                      height: 70,
                      text: ' Search Store',
                      top: 180,
                      left: 30,),
                  ],
                ),
                SizedBox(height: 25,),
                CarouselSlider(items: ShopHomeCubit
                    .get(context)
                    .homeModel!
                    .data!
                    .banners
                    .map((e) =>
                    Image(image: NetworkImage('${e.image}'),
                      width: double.infinity,
                      fit: BoxFit.cover,))
                    .toList(),
                    options: CarouselOptions(enlargeCenterPage: true)),
                SizedBox(height: 40,),
                TextComponent(text: " Categories",
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Colors.black45,),
                SizedBox(height: 10,),
                CarouselSlider(items: ShopHomeCubit
                    .get(context)
                    .categoriesModel!
                    .data!
                    .categories
                    .map((e) =>
                    Category(image: '${e.image}',
                      color: e.name == 'sports' ? Colors.deepOrange :
                      e.name == 'Prevent Corona' ? Colors.green : e.name ==
                          'electrionic devices' ? Colors.deepPurple :
                      e.name == 'Lighting' ? Colors.blueGrey : Colors.redAccent,
                      name: ' ${e.name}',
                      width: 240,)).toList(),
                    options: CarouselOptions(
                        enlargeCenterPage: true, height: 150)),
                SizedBox(height: 30,),
                TextComponent(text: ' All Products',
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 0),
                  child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 0,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.55,
                      children: [
            for(var i=0;i<ShopHomeCubit.get(context).homeModel!.data!.products.length;i++)
              ProductComponent(model: ShopHomeCubit.get(context).homeModel!.data!.products[i],
                token: args,
              )
          ],
                  ),
                ),
              ],
            ),
          );

        }
  }
