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
      body: ListView(
        children: List.generate(
          Get.find<FavoritesController>().count,
          (int i) {
            return Container(
              color: Colors.white,
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.all(10),
              child: GetBuilder<FavoritesController>(
                builder: (FavoritesController controller) {
                  return ListTile(
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
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
