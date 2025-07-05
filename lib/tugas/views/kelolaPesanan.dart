import 'package:flutter/material.dart';
import 'package:latihan/tugas/providers/orderProvider.dart';
import 'package:latihan/tugas/views/metode_pembayaran.dart';
import 'package:latihan/tugas/views/partner.dart';
import 'package:latihan/tugas/views/pilihan.dart';
import 'package:provider/provider.dart';

class KelolaPesanan extends StatelessWidget {
  const KelolaPesanan({super.key});

  @override
  Widget build(BuildContext context) {
    final orderController = context.watch<OrderProvider>();
    final orders = orderController.orderList;

    return Scaffold(
      appBar: AppBar(title: Text('Kelola Pesanan'), centerTitle: true),
      body:
          orders.isEmpty
              ? Center(child: Text('Belum ada pesanan'))
              : ListView.builder(
                itemCount: orders.length,
                itemBuilder: (context, index) {
                  final order = orders[index];
                  return Card(
                    margin: EdgeInsets.all(12),
                    elevation: 12,
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Partner : ${order.namaPartner}',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('Kategori : ${order.kategori}'),
                          Text('Paket : ${order.namaPaket}'),
                          Text('Harga : ${order.hargaPaket}'),
                          Text('Tanggal : ${order.tanggalOrder.toLocal()}'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              Partner(kategori: order.kategori),
                                    ),
                                  );
                                  orderController.deleteOrder(order.idOrder);
                                },
                                child: Text('Ubah Pesanan'),
                              ),
                              IconButton(
                                onPressed: () {
                                  orderController.deleteOrder(order.idOrder);
                                },
                                icon: Icon(
                                  Icons.delete_outline,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          ),
                          TextButton(
                            onPressed:
                                order.isConfirmed
                                    ? null
                                    : () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => MetodePembayaran(
                                                order: order,
                                              ),
                                        ),
                                      );
                                    },
                            child: Text(
                              order.isConfirmed
                                  ? 'Terkonfirmasi'
                                  : 'Konfirmasi',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              orderController.deleteOrder(order.idOrder);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Pesanan Diselesaikan')),
                              );
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => HalamanPilhan(),
                                ),
                              );
                            },
                            child: Text(
                              'Selesaikan Pesanan',
                              style: TextStyle(color: Colors.blueAccent[700]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}
