import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PartnerProvider extends ChangeNotifier {
  List<PartnerModel> _partnerList = [];
  List<PartnerModel> get partnerList => _partnerList;

  PartnerModel? _selectedPartner;
  PartnerModel? get selectedPartner => _selectedPartner;

  bool isLoading = false;
  String? errorMessage;

  void pilihPartner(PartnerModel partner) {
    _selectedPartner = partner;
    notifyListeners();
  }

  Future<void> getDataPartner() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    Dio dio = Dio();
    try {
      var res = await dio.get(
        'https://6869a7392af1d945cea24cd5.mockapi.io/api/v1/partners',
      );
      if (res.statusCode == 200) {
        final data = res.data as List;
        _partnerList = data.map((e) => PartnerModel.fromJson(e)).toList();
        final encoded = jsonEncode(data);
        await prefs.setString('cachePartners', encoded);
      } else {
        errorMessage = 'Gagal mengambil data partner. (${res.statusCode})';
      }
    } catch (e) {
      final cached = prefs.getString('cachedPartners');
      if (cached != null) {
        final decoded = jsonDecode(cached);
        _partnerList =
            (decoded as List).map((e) => PartnerModel.fromJson(e)).toList();
        errorMessage = 'Gagal mengambil data. Menampilkan data offline';
      } else {
        errorMessage =
            'Gagal mengambil data partner dan tidak ada cache tersedia.';
      }
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
