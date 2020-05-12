import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_get/favorites_controller.dart';
import 'package:package_get/favorites_page.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get - Thizer"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () => Get.to(FavoritesPage()),
          ),
        ],
      ),
      body: GetBuilder<FavoritesController>(
        init: FavoritesController(),
        builder: (FavoritesController controller) {
          return GridView.count(
            crossAxisCount: 3,
            children: List.generate(
              Colors.primaries.length,
              (int i) {
                return Stack(
                  children: <Widget>[
                    Container(color: Colors.primaries[i]),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.only(top: 10, right: 10),
                        child: IconButton(
                          padding: EdgeInsets.all(0),
                          icon: Icon(
                            controller.isChecked(i) ? Icons.favorite : Icons.favorite_border,
                            color: Colors.red[300],
                          ),
                          color: Colors.white,
                          onPressed: () {
                            Get.find<FavoritesController>().toggle(i);
                          },
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
