import 'package:tugas_akhir/models/product_model.dart';
class TransactionItemModel {
  int id;
  int user_id;
  int product_id;
  int transaction_id;
  int quantity_id;
  ProductModel product;

  TransactionItemModel({
    this.id,
    this.user_id,
    this.product_id,
    this.transaction_id,
    this.quantity_id,
    this.product
  });

  TransactionItemModel.fromJson(Map<String, dynamic> json) {
    print('print : $json');
    id = json['id'];
    user_id = json['user_id'];
    product_id = json['product_id'];
    transaction_id = json['trasanction_id'];
    quantity_id = json['quantity_id'];
    product = ProductModel.fromJson(json['product']);

  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': user_id,
      'product_id': product_id,
      'transaction_id': transaction_id,
      'quantity_id': quantity_id,
      
      'product': product.toJson(),
    };
  }
}
