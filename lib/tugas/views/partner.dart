import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';
import 'package:latihan/tugas/providers/partnerProvider.dart';
import 'package:latihan/tugas/others/custom_partner.dart';
import 'package:latihan/tugas/views/real_life.dart';
import 'package:latihan/tugas/views/virtual.dart';
import 'package:provider/provider.dart';

class Partner extends StatefulWidget {
  final String kategori;
  const Partner({super.key, required this.kategori});

  @override
  State<Partner> createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<PartnerProvider>(context, listen: false).getDataPartner();
    });
  }

  @override
  Widget build(BuildContext context) {
    final partnerProvider = context.watch<PartnerProvider>();
    if (partnerProvider.isLoading) {
      return Scaffold(
        appBar: AppBar(title: Text('Pilihan Partner ${widget.kategori}')),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final selectKategori = kategoriValues.map[widget.kategori];
    final listPartner =
        partnerProvider.partnerList
            .where((p) => p.kategori == selectKategori)
            .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Pilihan Partner ${widget.kategori}'),
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
                    if (widget.kategori.toLowerCase() == 'virtual') {
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
