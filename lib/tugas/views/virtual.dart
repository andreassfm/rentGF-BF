import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';
import 'package:latihan/tugas/others/custom_paket.dart';
import 'package:latihan/tugas/views/checkout.dart';

class Virtual extends StatefulWidget {
  final PartnerModel partner;
  const Virtual({super.key, required this.partner});

  @override
  State<Virtual> createState() => _VirtualState();
}

class _VirtualState extends State<Virtual> {
  String groupVirtual = '';

  void handleRadioValueChangeVirtual(value) {
    setState(() {
      groupVirtual = value!;
    });
  }

  int getHarga(String paketVirtual) {
    switch (paketVirtual) {
      case '30 Menit':
        return 25000;
      case '1 Jam':
        return 50000;
      case '2 Jam':
        return 80000;
      case '3 Jam':
        return 130000;
      case '6 Jam':
        return 250000;
      case '12 Jam':
        return 450000;
      default:
        return 0;
    }
  }

  final List<String> paketList = [
    '30 Menit',
    '1 Jam',
    '2 Jam',
    '3 Jam',
    '6 Jam',
    '12 Jam',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paket Virtual',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              'Partner : ${widget.partner.namaPartner}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: paketList.length,
              itemBuilder: (context, index) {
                final paket = paketList[index];
                return CustomPaket(
                  paket: paket,
                  groupValue: groupVirtual,
                  onChanged: handleRadioValueChangeVirtual,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed:
                  groupVirtual.isEmpty
                      ? null
                      : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Checkout(
                                  namaPaket: groupVirtual,
                                  hargaPaket: getHarga(groupVirtual),
                                  partner: widget.partner,
                                ),
                          ),
                        );
                      },
              child: Text('Pilih Paket'),
              style: ElevatedButton.styleFrom(
                maximumSize: Size(double.infinity, 50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
