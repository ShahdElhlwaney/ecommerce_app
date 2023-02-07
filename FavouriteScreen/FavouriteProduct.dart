import 'package:flutter/material.dart';
import '../GeneralComponents/TextComponent.dart';
import 'models/get_favorites_model.dart';
class FavouriteProduct extends StatelessWidget {
  const FavouriteProduct( {required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          boxShadow: [BoxShadow(color: Colors.grey,blurRadius: 2)],
         color: Colors.white
      ),
     width:363.6 ,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(image: NetworkImage(product.image!),width: 55,),
         // SizedBox(width: 15),
          SizedBox(height: 30,),
          TextComponent(text: '${product.name!}'.substring(0,17),color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16,),
          SizedBox(height: 5,),
         SizedBox(width: 30,),
          TextComponent(text: '\$${product.price}',color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold,),
          SizedBox(width: 10,),
          Icon(Icons.arrow_forward_ios,color: Colors.black,)
        ],
      ),
    );
  }
}
