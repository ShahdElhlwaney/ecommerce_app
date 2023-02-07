import 'package:ecommerce_app/GeneralComponents/TextComponent.dart';
import 'package:flutter/material.dart';
class Category extends StatelessWidget {
  const Category({required this.color,required this.image,required this.name,required this.width,});
final Color color;
final String? image,name;
final double width;
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(color: color,width: 3),
          borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight:Radius.circular(15),
            bottomRight:Radius.circular(15),bottomLeft:Radius.circular(15),),
           color: Colors.white
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
         //SizedBox(width: 5,),
          Image(image: NetworkImage(image!) ,fit: BoxFit.cover,width: 130,height: 130,),
         //SizedBox(width: 3,),
          TextComponent(text: name!,color: Colors.black45,fontSize: 20,fontWeight: FontWeight.bold,)
        ],
      ),
    );
  }
}
