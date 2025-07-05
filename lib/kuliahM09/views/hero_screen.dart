import 'package:flutter/material.dart';
import 'package:latihan/kuliahM09/controllers/hero_provider.dart';
import 'package:latihan/kuliahM09/models/hero_model.dart';
import 'package:provider/provider.dart';

class HeroScreen extends StatelessWidget {
  const HeroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final poweController = TextEditingController();
    final heroProvider = context.watch<HeroProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Hero Screen')),
      body: Column(
        children: [
          Consumer<HeroProvider>(
            builder: (context, provider, child) {
              if (provider.isLoadHero) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: provider.heroData.length,
                  itemBuilder: (BuildContext context, int index) {
                    final data = provider.heroData;
                    return Center(
                      child: ListTile(
                        selected:
                            heroProvider.selectedHero == data[index].name
                                ? true
                                : false,
                        selectedColor: Colors.blue,
                        title: Text(data[index].name ?? "-"),
                        subtitle: Text(data[index].power ?? ''),
                        onTap: () {
                          provider.gantiHero(data[index].name!);
                        },
                      ),
                    );
                  },
                );
              }
            },
          ),
          const Divider(),
          if (heroProvider.selectedHero.isEmpty)
            const Text("No Hero Selected")
          else
            showHero(context),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama Hero'),
                ),
                TextField(
                  controller: poweController,
                  decoration: InputDecoration(labelText: 'Power Hero'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (nameController.text.isNotEmpty &&
                        poweController.text.isNotEmpty) {
                      heroProvider.tambahHeroBaru(
                        namaHero: nameController.text,
                        power: poweController.text,
                        age: 25,
                      );
                      nameController.clear();
                      poweController.clear();
                    }
                  },
                  child: Text('Tambah Hero'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  showHero(BuildContext context) {
    final heroProvider = context.watch<HeroProvider>();
    heroProvider.heroData.firstWhere(
      (hero) => hero.name == heroProvider.selectedHero,
      orElse: () => HeroModel(name: '-', power: '-', age: 0),
    );

    return Column(
      children: [
        Text("Selected Hero: ${heroProvider.selectedHero}"),
        Text("Hero power ${heroProvider.heroData[0].showPower()}"),
      ],
    );
  }
}
