import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Latihanm11 extends StatefulWidget {
  const Latihanm11({super.key});

  @override
  State<Latihanm11> createState() => _Latihanm11State();
}

class _Latihanm11State extends State<Latihanm11> {
  final dio = Dio();
  final url = 'https://6841c8b9d48516d1d35cdfb7.mockapi.io/api/vi/Kegiatan';

  Future<List<dynamic>> getData() async {
    var response = await dio.get(url);
    return response.data;
  }

  void showFormDialog(int? id, String? aktivitasAwal) {
    TextEditingController controller = TextEditingController();
    controller.text = aktivitasAwal ?? '';
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(id == null ? 'Tambah Aktivitas' : 'Edit Aktivitas'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: 'Masukkan Aktivitas'),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (id == null) {
                    await dio.post(
                      url,
                      data: {
                        "judul": controller.text,
                        "tanggal": DateTime.now().toIso8601String(),
                      },
                    );
                  } else {
                    await dio.put(
                      '$url/$id',
                      data: {
                        "judul": controller.text,
                        "tanggal": DateTime.now().toIso8601String(),
                      },
                    );
                  }
                  Navigator.pop(context);
                  setState(() {});
                },
                child: Text('Save'),
              ),
            ],
          ),
    );
  }

  void hapusKegiatan(String id) async {
    await dio.delete('$url/$id');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kegiatan Pacaran')),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (!snapshot.hasData ||
              snapshot.data == null ||
              snapshot.data!.isEmpty)
            return Center(child: Text('Kita Belum Ngapa - Ngapain'));

          var data = snapshot.data!;
          return ListView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Jumlah Kegiatan Kita: ${data.length}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              ...data.map(
                (item) => ListTile(
                  title: Text('${item['judul']}'),
                  subtitle: Text(
                    '${item['tanggal'].toString().substring(0, 10)}',
                  ),
                  trailing: Wrap(
                    spacing: 12,
                    children: [
                      IconButton(
                        onPressed:
                            () => showFormDialog(item['id'], item['judul']),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => hapusKegiatan(item['id']),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showFormDialog(null, null),
        backgroundColor: Colors.pink,
        child: Icon(Icons.favorite),
      ),
    );
  }
}
