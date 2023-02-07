

class CategoriesModel
{
  bool? status;
  CategoriesData? data;
  CategoriesModel.fromJson(Map<String,dynamic>json)
  {
    status=json['status'];
    data =CategoriesData.fromJson(json['data']);
  }
}
class CategoriesData
{
List<CategoryModel> categories=[];
CategoriesData.fromJson(Map<String,dynamic>json)
{
  json['data'].forEach((element){
    categories.add(CategoryModel.fromJson(element));
  });}
}
class CategoryModel
{

int? id;
String? name;
String?image;
CategoryModel.fromJson(Map<String,dynamic>json)
{
  id=json['id'];
  name=json['name'];
  image=json['image'];
}
}