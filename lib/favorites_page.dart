import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_get/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get - Thizer"),
      ),
      backgroundColor: Colors.grey[200],

      /// Quando um item é removido, o listview precisa ser atualizado
      /// porque no momento que o metodo build foi chamado há x números de itens,
      /// Se o widget não está dentro de uma função (geralmente builder:(){}) ele
      /// não tem como atualizar a si próprio, isso pode dar erro "RangeError (index...)"
      /// Se fosse um ListView.builder, teria o itemCount que teria um número que precisaria
      /// ser atualizado, usando ListView com um gerador de widgets, o listview pai precisa ser atualizado
      body: GetBuilder<FavoritesController>(
          builder: (FavoritesController controller) {
        return ListView(
          children: List.generate(
            Get.find<FavoritesController>().count,
            (int i) {
              return Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    leading: Container(
                      color: Colors.primaries[controller.itemAt(i)],
                      width: 60,
                    ),
                    title: Text("Cor número #$i"),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.red[300],
                      ),
                      onPressed: () {
                        Get.find<FavoritesController>().removeAt(i);
                      },
                    ),
                  ));
            },
          ),
        );
      }),
    );
  }
}
