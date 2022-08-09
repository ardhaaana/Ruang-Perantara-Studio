import 'package:tugas_akhir/models/gallery_model.dart';
import 'package:tugas_akhir/models/keranjang_model.dart';
import 'package:tugas_akhir/models/product_model.dart';
import 'package:tugas_akhir/models/transactionitem_model.dart';

class TransactionModel {
  int id;
  String user_id;
  String address;
  double total_price;
  double shipping_price;
  String status;
  String payment;
  DateTime createdAt;
  //KeranjangModel cart;
  //ProductModel product;
  //List<GalleryModel> galleries;

  TransactionModel({
      this.id,
      this.user_id,
      this.address,
      this.total_price,
      this.shipping_price,
      this.status,
      this.payment,
      this.createdAt,
      //this.cart,
      //this.product,
      //this.galleries,
      });

  TransactionModel.fromJson(Map<String, dynamic> json) {
    print('print : $json');
    id = json['id'];
    user_id = json['name'];
    address = json['address'];
    total_price = double.parse(json['total_price'].toString());
    shipping_price = double.parse(json['shipping_price'].toString());
    status = json['status'];
    payment = json['payment'];
    createdAt = DateTime.parse(json['created_at']);
    // createdAt = DateTime.parse(json['created_at'].toString());
    // galleries = json['galleries']
    //     .map<GalleryModel>((gallery) => GalleryModel.fromJson(gallery))
    //     .toList();
    // product = ProductModel.fromJson(json['product']);
    //cart = KeranjangModel.fromJson(json['cart']);
    // item = TransactionItemModel.fromJson(json['item']);
   
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'address': address,
      'total_price': total_price,
      'shipping_price': shipping_price,
      'status': status,
      'payment': payment,

      'createdAt': createdAt.toString(),
      //'galleries': galleries.map((gallery) => gallery.toJson()).toList(),
      // 'product': product.toJson(),
      //'cart': cart.toJson(),
    };
  }
}