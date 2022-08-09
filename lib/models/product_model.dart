import 'package:tugas_akhir/models/kategori_model.dart';
import 'package:tugas_akhir/models/gallery_model.dart';

class ProductModel {
  int id;
  String name;
  double price;
  String description;
  KategoriModel category;
  DateTime createdAt;
  DateTime updateAt;
  DateTime deleteAt;
  List<GalleryModel> galleries;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.category,
    this.createdAt,
    this.updateAt,
    this.deleteAt,
    this.galleries,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = KategoriModel.fromJson(json['category']);
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
    createdAt = DateTime.parse(json['created_at']);
    updateAt = DateTime.parse(json['updated_at']);
    deleteAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at'] as String);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'category': category.toJson(),
      'createdAt': createdAt.toString(),
      'updateAt': updateAt.toString(),
      'deleteAt': deleteAt.toString(),
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }
}
