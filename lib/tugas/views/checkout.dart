import 'package:flutter/material.dart';
import 'package:latihan/tugas/providers/orderProvider.dart';
import 'package:latihan/tugas/providers/userProvider.dart';
import 'package:latihan/tugas/models/orderModel.dart';
import 'package:latihan/tugas/models/partnerModel.dart';
import 'package:latihan/tugas/views/kelolaPesanan.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  final String namaPaket;
  final int hargaPaket;
  final PartnerModel partner;

  const Checkout({
    super.key,
    required this.namaPaket,
    required this.hargaPaket,
    required this.partner,
  });

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  String? metodeTerpilih;

  final List<String> listMetode = ['Transfer Bank', 'E-Wallet', 'QRIS'];

  @override
  Widget build(BuildContext context) {
    final userController = context.read<UserProvider>();
    final orderController = context.read<OrderProvider>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(widget.partner.fotoPartner),
                  radius: 30,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Partner : ${widget.partner.namaPartner}',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        widget.partner.bioPartner,
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Paket : ${widget.namaPaket}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text(
              'Harga : ${widget.hargaPaket}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text('Metode Pembayaran:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(border: OutlineInputBorder()),
              value: metodeTerpilih,
              hint: Text('Pilih metode pembayaran'),
              items:
                  listMetode.map((metode) {
                    return DropdownMenuItem(value: metode, child: Text(metode));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  metodeTerpilih = value;
                });
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed:
                  metodeTerpilih == null
                      ? null
                      : () {
                        final order = OrderModel(
                          idOrder: DateTime.now().millisecondsSinceEpoch,
                          idPartner: widget.partner.idPartner,
                          username: userController.user!.username,
                          namaPartner: widget.partner.namaPartner,
                          namaPaket: widget.namaPaket,
                          hargaPaket: widget.hargaPaket,
                          kategori: widget.partner.kategori,
                          tanggalOrder: DateTime.now(),
                          isConfirmed: true,
                          metodePembayaran: metodeTerpilih!,
                        );
                        orderController.addOrder(order);
                        final checkoutContext = context;
                        showDialog(
                          context: checkoutContext,
                          barrierDismissible: false,
                          builder: (BuildContext contextDialog) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              title: Text('Pesanan Berhasil Dibuat!'),
                              content: Text('Lihat Pesanan Kamu!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(contextDialog).pop();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => KelolaPesanan(),
                                      ),
                                    );
                                  },
                                  child: Text('Kelola Pesanan'),
                                ),
                              ],
                            );
                          },
                        );
                      },
              child: Text('Buat Pesanan'),
            ),
          ],
        ),
      ),
    );
  }
}
