import 'package:flutter/material.dart';
import 'package:latihan/tugas/views/partner.dart';

void main() {
  runApp(HalamanPilhan());
}

class HalamanPilhan extends StatelessWidget {
  const HalamanPilhan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPilihan(
              context,
              title: 'Virtual',
              deskripsi:
                  'Video Call, Chat, atau Sleep Call bareng Pacar Online Kamu.',
              image: 'assets/images/virtual.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Partner(kategori: 'Virtual',)),
                );
              },
            ),
            SizedBox(height: 20),
            _buildPilihan(
              context,
              title: 'Real Life',
              deskripsi: 'Ketemu langsung serasa pacaran beneran.',
              image: 'assets/images/real life.jpg',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Partner(kategori: 'Real Life',)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPilihan(
    BuildContext context, {
    required String title,
    required String deskripsi,
    required String image,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(deskripsi, style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
