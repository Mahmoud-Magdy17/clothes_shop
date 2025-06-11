import 'package:equatable/equatable.dart';

class CartItemModel extends Equatable {
  final int? productId;
  final String? productName;
  final int? quantity;
  final double? price;
  final String? image;
  final String? material;
  final String? subCategory;
  final double? totalPriceForProduct;

  const CartItemModel({
    this.productId,
    this.productName,
    this.quantity,
    this.price,
    this.image,
    this.material,
    this.subCategory,
    this.totalPriceForProduct,
  });

  CartItemModel copyWith({
    int? productId,
    String? productName,
    int? quantity,
    double? price,
    String? image,
    String? material,
    String? subCategory,
    double? totalPriceForProduct,
  }) {
    return CartItemModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      image: image ?? this.image,
      material: material ?? this.material,
      subCategory: subCategory ?? this.subCategory,
      totalPriceForProduct: totalPriceForProduct ?? this.totalPriceForProduct,
    );
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        productId: json['productId'] as int?,
        productName: json['productName'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as double?,
        image: json['image'] as String?,
        material: json['material'] as String?,
        subCategory: json['subCategory'] as String?,
        totalPriceForProduct: json['totalPriceForProduct'] as double?,
      );

  Map<String, dynamic> toJson() => {
        'productId': productId,
        'productName': productName,
        'quantity': quantity,
        'price': price,
        'image': image,
        'material': material,
        'subCategory': subCategory,
        'totalPriceForProduct': totalPriceForProduct,
      };

  @override
  List<Object?> get props {
    return [
      productId,
      productName,
      quantity,
      price,
      image,
      material,
      subCategory,
      totalPriceForProduct,
    ];
  }
}
