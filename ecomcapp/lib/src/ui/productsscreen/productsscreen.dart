import 'package:flutter/material.dart';

import '../product_description/model/product_model.dart';
import '../product_description/repository/product_repo.dart';
import '../product_description/widgets/grid_card.dart';

class ProductsScreen extends StatefulWidget {
  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<ProductModel>? model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provideData();
  }

  provideData() async {
    model = await ProductRepo().getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Grid View"),
          toolbarHeight: 50,
          backgroundColor: Colors.indigo),
      body: GridView.builder(
        itemCount: model?.length,
        itemBuilder: (ctx, index) {
          return GridCard(
            product: model![index].title.toString().substring(0, 10),
            date: DateTime.now(),
            desciption: model![index].description.toString().substring(0, 30),
            imgsource: model![index].image.toString(),
          );
        },
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
