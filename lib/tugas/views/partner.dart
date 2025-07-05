import 'package:flutter/material.dart';
import 'package:latihan/tugas/providers/partnerProvider.dart';
import 'package:latihan/tugas/others/custom_partner.dart';
import 'package:latihan/tugas/views/real_life.dart';
import 'package:latihan/tugas/views/virtual.dart';
import 'package:provider/provider.dart';

class Partner extends StatelessWidget {
  final String kategori;
  const Partner({super.key, required this.kategori});

  @override
  Widget build(BuildContext context) {
    final partnerProvider = context.watch<PartnerProvider>();
    final listPartner =
        partnerProvider.partnerList
            .where((p) => p.kategori == kategori)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilihan Partner ${kategori}'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: listPartner.length,
        itemBuilder: (context, index) {
          final partner = listPartner[index];
          final isSelected =
              partnerProvider.selectedPartner?.idPartner == partner.idPartner;

          return CustomPartner(
            partner: partner,
            isSelected: isSelected,
            onTap: () => partnerProvider.pilihPartner(partner),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16),
        child: ElevatedButton(
          onPressed:
              partnerProvider.selectedPartner == null
                  ? null
                  : () {
                    if (kategori.toLowerCase() == 'virtual') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => Virtual(
                                partner: partnerProvider.selectedPartner!,
                              ),
                        ),
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => RealLife(
                                partner: partnerProvider.selectedPartner!,
                              ),
                        ),
                      );
                    }
                  },
          child: Text('Pilih Partner'),
        ),
      ),
    );
  }
}
