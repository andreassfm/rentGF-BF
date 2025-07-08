import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:latihan/tugas/models/orderModel.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> simpanPesananDatabase(OrderModel order) async {
    try {
      await _firestore.collection('orders').add({
        'idOrder': order.idOrder,
        'idPartner': order.idPartner,
        'username': order.username,
        'namaPartner': order.namaPartner,
        'namaPaket': order.namaPaket,
        'hargaPaket': order.hargaPaket,
        'kategori': order.kategori,
        'tanggalOrder': order.tanggalOrder.toIso8601String(),
        'metodePembayaran': order.metodePembayaran,
        'isConfirmed': order.isConfirmed,
      });
    } catch (e) {
      print('Gagal menyimpan pesanan ke Firestore: $e');
    }
  }
}