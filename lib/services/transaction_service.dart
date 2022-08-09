import 'dart:convert';
import 'package:tugas_akhir/models/keranjang_model.dart';
import 'package:tugas_akhir/models/transaction_model.dart';
import 'package:tugas_akhir/models/user_model.dart';
import 'package:http/http.dart' as http;

class TransactionService {
  String baseUrl = 'http://10.0.2.2:8000/api';

  Future<bool> checkout(
      String token, List<KeranjangModel> carts, double totalPrice) async {
    var url = Uri.parse('$baseUrl/checkout');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode(
      {
        //'address': 'Marsemoon',
        'items': carts
            .map(
              (cart) => {
                'id': cart.product.id,
                'quantity': cart.quantity,
              },
            )
            .toList(),
        'status': 'PENDING',
        'total_price': totalPrice,
        'shipping_price': 0,
        
      },
    );
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal melakukan checkout');
    }
  }

  Future<List<TransactionModel>> getTransaction(UserModel user) async {
    var id = user.id;
    var url = Uri.parse('$baseUrl/transactions/$id');
    var headers = {
      'Content-type': 'application/json',
      'Authorization': user.token,
    };
    var body = jsonEncode(
      {'user_id': user.id},
    );
    var response = await http.get(url, headers: headers);

    print(response.body);
   

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      List<TransactionModel> transaction = [];

      for (var item in data) {
        transaction.add(TransactionModel.fromJson(item));
      }
      
      return transaction;
    } else {
      throw Exception('Gagal mengambil transaksi');
    }
  }
}