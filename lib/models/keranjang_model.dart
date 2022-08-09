import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/models/gallery_model.dart';
import 'package:tugas_akhir/models/transactionitem_model.dart';

class KeranjangModel {
  int id;
  ProductModel product;
  int quantity;
  List<GalleryModel> galleries;
  TransactionItemModel item;


  KeranjangModel({
    this.id,
    this.item,
    this.product,
    this.quantity, 
    this.galleries,
  });

  KeranjangModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    item = TransactionItemModel.fromJson(json['item']);
    product = ProductModel.fromJson(json['product']);
    quantity = json['quantity'];
    galleries = json['galleries']
        .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': item.toJson(),
      'product': product.toJson(),
      'quantity': quantity,
      'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
