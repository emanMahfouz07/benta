class CategoryModel {
  final String name;

  CategoryModel(this.name);

  factory CategoryModel.fromJson(String json) => CategoryModel(json);
}
