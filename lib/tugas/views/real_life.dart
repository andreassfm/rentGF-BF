import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';
import 'package:latihan/tugas/others/custom_paket.dart';
import 'package:latihan/tugas/views/checkout.dart';

class RealLife extends StatefulWidget {
  final PartnerModel partner;
  const RealLife({super.key, required this.partner});

  @override
  State<RealLife> createState() => _RealLifeState();
}

class _RealLifeState extends State<RealLife> {
  String groupRealLife = '';

  void handleRadioValueChangeRealLife(value) {
    setState(() {
      groupRealLife = value!;
    });
  }

  int getHarga(String paketRealLife) {
    switch (paketRealLife) {
      case '2 Jam':
        return 70000;
      case '3 Jam':
        return 95000;
      case '5 Jam':
        return 145000;
      case '8 Jam':
        return 260000;
      case '10 Jam':
        return 330000;
      case 'Paket Jalani Dulu (1 Hari)':
        return 600000;
      case 'Paket Udah Mulai Sayang (1 Minggu)':
        return 4000000;
      case 'Paket Pengen Serius (1 Bulan)':
        return 8000000;
      default:
        return 0;
    }
  }

  final List<String> paketList = [
    '2 Jam',
    '3 Jam',
    '5 Jam',
    '8 Jam',
    '10 Jam',
    'Paket Jalani Dulu (1 Hari)',
    'Paket Udah Mulai Sayang (1 Minggu)',
    'Paket Pengen Serius (1 Bulan)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Paket Real Life',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: paketList.length,
              itemBuilder: (context, index) {
                final paket = paketList[index];
                return CustomPaket(
                  paket: paket,
                  groupValue: groupRealLife,
                  onChanged: handleRadioValueChangeRealLife,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton(
              onPressed:
                  groupRealLife.isEmpty
                      ? null
                      : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => Checkout(
                                  namaPaket: groupRealLife,
                                  hargaPaket: getHarga(groupRealLife),
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
