class OrderModel {
  final int idOrder;
  final int idPartner;
  final String username;
  final String namaPartner;
  final String namaPaket;
  final int hargaPaket;
  final String kategori;
  final DateTime tanggalOrder;
  final String metodePembayaran;
  final bool isConfirmed;

  OrderModel({
    required this.idOrder,
    required this.idPartner,
    required this.username,
    required this.namaPartner,
    required this.namaPaket,
    required this.hargaPaket,
    required this.kategori,
    required this.tanggalOrder,
    required this.metodePembayaran,
    required this.isConfirmed,
  });

  Map<String, dynamic> toMap() {
    return {
      'idOrder': idOrder,
      'idPartner': idPartner,
      'namaPartner': namaPartner,
      'namaPaket': namaPaket,
      'hargaPaket': hargaPaket,
      'kategori': kategori,
      'tanggalOrder': tanggalOrder.toIso8601String(),
      'isConfirmed': isConfirmed,
      'metodePembayaran': metodePembayaran,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> json) {
    return OrderModel(
      idOrder: json['idOrder'],
      idPartner: json['idPartner'],
      username: json['username'],
      namaPartner: json['namaPartner'],
      namaPaket: json['namaPaket'],
      hargaPaket: json['hargaPaket'],
      kategori: json['kategori'],
      tanggalOrder: DateTime.parse(json['tanggalOrder']),
      isConfirmed: true,
      metodePembayaran: json['metodePembayaran']
    );
  }
}
