class FavoriteItem {
  int? productId;
  String? name;
  double? price;
  String? imagePath;
  String? subCategory;
  int? categoryId;

  FavoriteItem({
    this.productId,
    this.name,
    this.price,
    this.imagePath,
    this.subCategory,
    this.categoryId,
  });

  factory FavoriteItem.fromJson(Map<String, dynamic> json) => FavoriteItem(
    productId: json['productId'] as int?,
    name: json['name'] as String?,
    price: json['price'] as double?,
    imagePath: json['imagePath'] as String?,
    subCategory: json['subCategory'] as String?,
    categoryId: json['categoryId'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'productId': productId,
    'name': name,
    'price': price,
    'imagePath': imagePath,
    'subCategory': subCategory,
    'categoryId': categoryId,
  };
}
