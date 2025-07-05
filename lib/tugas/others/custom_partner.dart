import 'package:flutter/material.dart';
import 'package:latihan/tugas/models/partnerModel.dart';

class CustomPartner extends StatelessWidget {
  final PartnerModel partner;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomPartner({
    super.key,
    required this.partner,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        elevation: isSelected ? 8 : 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side:
              isSelected
                  ? BorderSide(color: Colors.deepPurple, width: 2)
                  : BorderSide.none,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(partner.fotoPartner),
            radius: 30,
          ),
          title: Text(partner.namaPartner),
          subtitle: Text(partner.bioPartner),
          trailing:
              isSelected
                  ? Icon(Icons.check_circle, color: Colors.deepPurple)
                  : null,
        ),
      ),
    );
  }
}
