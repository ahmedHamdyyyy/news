
class CategoryModel {
  bool? status;
  CategoriesData? data;
  CategoryModel.formjson(Map<String, dynamic> json) {
    status = json['status'];
    data = CategoriesData.fromjson(json['data']);
  }
}

class CategoriesData {
  int? current_page;
  List<DataModel> data = [];

  CategoriesData.fromjson(Map<String, dynamic> json) {
    current_page = json['current_page'];
    json['data'].forEach((e) {
      data.add(DataModel.fromjson(e));
    });
  }
}

class DataModel {
  int? id;
  String? name;
  String? image;
  DataModel.fromjson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}