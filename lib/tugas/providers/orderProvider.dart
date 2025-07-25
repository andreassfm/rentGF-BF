import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:latihan/tugas/models/orderModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderModel> _orderList = [];
  List<OrderModel> get orderList => _orderList;

  bool isLoading = true;
  String? errorMessage;

  void addOrder(OrderModel order) async {
    _orderList.add(order);
    notifyListeners();
    await saveToLocal();
  }

  Future<void> saveToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final data = _orderList.map((e) => e.toMap()).toList();
    prefs.setString('orderList', jsonEncode(data));
  }

  Future<void> loadFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('orderList');
    if (data != null) {
      final decoded = jsonDecode(data) as List;
      _orderList = decoded.map((e) => OrderModel.fromMap(e)).toList();
      notifyListeners();
    }
  }

  void deleteOrder(int idOrder) {
    _orderList.removeWhere((orderList) => orderList.idOrder == idOrder);
    notifyListeners();
  }

  void updateOrder(OrderModel updateOrder) {
    final index = _orderList.indexWhere(
      (orderList) => orderList.idOrder == updateOrder.idOrder,
    );
    if (index != -1) {
      _orderList[index] = updateOrder;
      notifyListeners();
    }
  }

  void clearOrder() async {
    _orderList.clear();
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('orderList');
  }

  void konfirmasiPesanan(int idOrder, String metodePembayaran) {
    final index = _orderList.indexWhere(
      (orderList) => orderList.idOrder == idOrder,
    );
    if (index != -1) {
      final updateOrder = OrderModel(
        idOrder: _orderList[index].idOrder,
        idPartner: _orderList[index].idPartner,
        username: _orderList[index].username,
        namaPartner: _orderList[index].namaPartner,
        namaPaket: _orderList[index].namaPaket,
        hargaPaket: _orderList[index].hargaPaket,
        kategori: _orderList[index].kategori,
        tanggalOrder: _orderList[index].tanggalOrder,
        metodePembayaran: metodePembayaran,
        isConfirmed: true,
      );
      _orderList[index] = updateOrder;
      saveToLocal();
      notifyListeners();
    }
  }

  Future<void> getDataOrders() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final response = await Dio().get(
        'https://686a35f22af1d945cea37ab1.mockapi.io/api/v1/orders',
      );
      if (response.statusCode == 200) {
        final data = response.data as List;
        _orderList = data.map((e) => OrderModel.fromMap(e)).toList();
      } else {
        errorMessage = 'Gagal memuat data: ${response.statusCode}';
      }
    } catch (e) {
      errorMessage = 'Terjadi kesalahan: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addOrderOnline(OrderModel order) async {
    try {
      final res = await Dio().post(
        'https://686a35f22af1d945cea37ab1.mockapi.io/api/v1/orders',
        data: order.toMap(),
      );
      if (res.statusCode == 201 || res.statusCode == 200) {
        _orderList.add(order);
        notifyListeners();
      } else {}
    } catch (e) {
      print('Gagal menambahkan data ke API: $e');
    }
  }
}
