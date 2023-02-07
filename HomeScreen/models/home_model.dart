

class HomeModel
{
bool? status;
HomeDataModel? data;
HomeModel.fromJson(Map<String,dynamic>json)
{
  status=json['status'];
  data=HomeDataModel.fromJson(json['data']);
}
}
class HomeDataModel
{
  List<bannerModel>banners=[];
  List<productModel>products=[];
HomeDataModel.fromJson(Map<String,dynamic>json)
  {
    json['banners'].forEach((element){
      banners.add(bannerModel.fromJson(element));
    });
    json['products'].forEach((element){
      products.add(productModel.fromJson(element));
    });
  }
}
class bannerModel
{
  int? id;
  String? image;
  bannerModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    image=json['image'];

  }
}
class productModel
{
  int? id;
  dynamic? price;
  dynamic? oldPrice;
  dynamic? discount;
  String? image;
  String? name;
  bool? inFavourites;
  bool? inCart;
  productModel.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    price=json['price'];
    oldPrice=json['old_price'];
    discount=json['discount'];
    image=json['image'];
    name=json['name'];
    inFavourites=json['in_favorites'];
    inCart=json['in_cart'];

  }
}