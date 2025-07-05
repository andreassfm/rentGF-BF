import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';

class PartnerProvider extends ChangeNotifier {
  final List<PartnerModel> _partnerList = [
    // Virtual
    PartnerModel(
      idPartner: 1,
      namaPartner: 'Jung Kook',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Jung Kook.jpg',
      bioPartner: 'Anak Tembung humoris dan suka main alat musik',
    ),
    PartnerModel(
      idPartner: 2,
      namaPartner: 'Manurios',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Manurios.jpg',
      bioPartner: 'Anak Marelan kece dan suka main basket',
    ),
    PartnerModel(
      idPartner: 3,
      namaPartner: 'Zayn Malik',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Zayn Malik.jpg',
      bioPartner: 'Anak Marindal yang hobi motoran',
    ),
    PartnerModel(
      idPartner: 4,
      namaPartner: 'Won Woo',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Won Woo.jpg',
      bioPartner: 'Anak Tanjung Mulia yang royal',
    ),
    PartnerModel(
      idPartner: 5,
      namaPartner: 'Harry Styles',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Harry Styles.jpg',
      bioPartner: 'Anak Binjai yang ekspresif',
    ),
    PartnerModel(
      idPartner: 6,
      namaPartner: 'Dasha Taran',
      jenisKelamin: 'Perempuan',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Dasha Taran.jpg',
      bioPartner: 'Anak Selayang yang hobi hangout',
    ),
    PartnerModel(
      idPartner: 7,
      namaPartner: 'Yessica Tamara',
      jenisKelamin: 'Perempuan',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Yessica Tamara.jpg',
      bioPartner: 'Anak Belawan yang romantis',
    ),
    PartnerModel(
      idPartner: 8,
      namaPartner: 'Shani Indira',
      jenisKelamin: 'Perempuan',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Shani Indira.jpg',
      bioPartner: 'Anak Martubung yang kalem',
    ),
    PartnerModel(
      idPartner: 9,
      namaPartner: 'Davina Karamoy',
      jenisKelamin: 'Perempuan',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Davina Karamoy.jpg',
      bioPartner: 'Anak Padang Bulan yang suka travelling',
    ),
    PartnerModel(
      idPartner: 10,
      namaPartner: 'Karmen',
      jenisKelamin: 'Perempuan',
      kategori: 'Virtual',
      fotoPartner: 'assets/images/Karmen.jpg',
      bioPartner: 'Anak Denai yang ceria',
    ),

    // Real Life
    PartnerModel(
      idPartner: 1,
      namaPartner: 'Jung Kook',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Jung Kook.jpg',
      bioPartner: 'Anak Tembung humoris dan suka main alat musik',
    ),
    PartnerModel(
      idPartner: 2,
      namaPartner: 'Manurios',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Manurios.jpg',
      bioPartner: 'Anak Marelan kece dan suka main basket',
    ),
    PartnerModel(
      idPartner: 3,
      namaPartner: 'Zayn Malik',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Zayn Malik.jpg',
      bioPartner: 'Anak Marindal yang hobi motoran',
    ),
    PartnerModel(
      idPartner: 4,
      namaPartner: 'Won Woo',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Won Woo.jpg',
      bioPartner: 'Anak Tanjung Mulia yang royal',
    ),
    PartnerModel(
      idPartner: 5,
      namaPartner: 'Harry Styles',
      jenisKelamin: 'Laki - Laki',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Harry Styles.jpg',
      bioPartner: 'Anak Binjai yang ekspresif',
    ),
    PartnerModel(
      idPartner: 6,
      namaPartner: 'Dasha Taran',
      jenisKelamin: 'Perempuan',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Dasha Taran.jpg',
      bioPartner: 'Anak Selayang yang hobi hangout',
    ),
    PartnerModel(
      idPartner: 7,
      namaPartner: 'Yessica Tamara',
      jenisKelamin: 'Perempuan',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Yessica Tamara.jpg',
      bioPartner: 'Anak Belawan yang romantis',
    ),
    PartnerModel(
      idPartner: 8,
      namaPartner: 'Shani Indira',
      jenisKelamin: 'Perempuan',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Shani Indira.jpg',
      bioPartner: 'Anak Martubung yang kalem',
    ),
    PartnerModel(
      idPartner: 9,
      namaPartner: 'Davina Karamoy',
      jenisKelamin: 'Perempuan',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Davina Karamoy.jpg',
      bioPartner: 'Anak Padang Bulan yang suka travelling',
    ),
    PartnerModel(
      idPartner: 10,
      namaPartner: 'Karmen',
      jenisKelamin: 'Perempuan',
      kategori: 'Real Life',
      fotoPartner: 'assets/images/Karmen.jpg',
      bioPartner: 'Anak Denai yang ceria',
    ),
  ];

  List<PartnerModel> get partnerList => _partnerList;

  PartnerModel? _selectedPartner;
  PartnerModel? get selectedPartner => _selectedPartner;

  void pilihPartner(PartnerModel partner) {
    _selectedPartner = partner;
    notifyListeners();
  }
}
