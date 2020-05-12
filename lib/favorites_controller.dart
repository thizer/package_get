import 'package:get/get.dart';

class FavoritesController extends GetController {
  final List<int> _itens = [];

  void toggle(int e) {
    if (isChecked(e)) {
      _itens.removeWhere((i) => i == e);
    } else {
      _itens.add(e);
    }

    update(this);
  }

  bool isChecked(int i) => _itens.contains(i);

  int itemAt(int i) => _itens[i];

  void removeAt(int i) {
    _itens.removeAt(i);

    update(this);
  }

  int get count => _itens.length;
}
