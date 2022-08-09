import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

import 'package:tugas_akhir/services/transaction_service.dart';

import '../models/keranjang_model.dart';
import '../models/transaction_model.dart';
import '../models/user_model.dart';

class TransactionProvider with ChangeNotifier {
  List<TransactionModel> _transactions = [];
  List<TransactionModel> get transactions => _transactions;

  set transactions(List<TransactionModel> transactions) {
    _transactions = transactions;
    notifyListeners();
  }

  Future<bool> checkout(
      String token, List<KeranjangModel> carts, double totalPrice) async {
    try {
      if (await TransactionService().checkout(token, carts, totalPrice)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);

      return false;
    }
  }

  Future<void>getTransactions(UserModel user) async {
    try {
      List<TransactionModel> transactions = await TransactionService().getTransaction(user);
      _transactions = transactions;
    } catch (e) {
      print(e);
    }
  }
}