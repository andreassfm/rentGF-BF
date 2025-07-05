import 'package:flutter/material.dart';
import 'package:latihan/tugas/providers/orderProvider.dart';
import 'package:latihan/tugas/models/orderModel.dart';
import 'package:provider/provider.dart';

class MetodePembayaran extends StatelessWidget {
  final OrderModel order;

  const MetodePembayaran({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    final orderController = context.read<OrderProvider>();
    String? metodeTerpilih;

    return Scaffold(
      appBar: AppBar(title: Text('Metode Pembayaran')),
      body: Column(
        children: [
          RadioListTile(
            value: Text('QRIS'),
            groupValue: metodeTerpilih,
            onChanged: (value) {
              metodeTerpilih = metodeTerpilih;
            },
          ),
          RadioListTile(
            value: Text('E-Wallet'),
            groupValue: metodeTerpilih,
            onChanged: (value) {
              metodeTerpilih = metodeTerpilih;
            },
          ),
          RadioListTile(
            value: Text('Transfer Bank'),
            groupValue: metodeTerpilih,
            onChanged: (value) {
              metodeTerpilih = metodeTerpilih;
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (metodeTerpilih != null) {
                orderController.konfirmasiPesanan(
                  order.idOrder,
                  metodeTerpilih!,
                );
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Pesanan Dikonfirmasi')));
                Navigator.pop(context);
              }
            },
            child: Text('Konfirmasi Pembayaran'),
          ),
        ],
      ),
    );
  }
}
