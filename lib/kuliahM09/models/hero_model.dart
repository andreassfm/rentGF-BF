// model hero
class HeroModel {
  String? name;
  String? power;
  int? age;

  HeroModel({this.name, this.power, this.age});

  String showPower() {
    if (power == 'Super Strength') {
      print('Hero ini memiliki kekuatan super strength');
      return "Hero ini memiliki kekuatan super strength";
    } else if (power == 'Super Speed') {
      print('Hero ini memiliki kekuatan super speed');
      return "Hero ini memiliki kekuatan super speed";
    } else {
      print('Hero ini memiliki kekuatan super kaya');
      return "Hero ini memiliki kekuatan super kaya";
    }
  }

  void showAge() {
    if (age! > 30) {
      print('Hero ini sudah tua');
    } else {
      print('Hero ini masih muda');
    }
  }
}