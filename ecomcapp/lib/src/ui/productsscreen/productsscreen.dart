import 'package:ecomcapp/src/widgets.dart/appBar.dart';
import 'package:flutter/material.dart';

import 'model/product_model.dart';
import 'repository/product_repo.dart';
import 'widgets/grid_card.dart';

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
      appBar: CustomAppBar(title: "Shop APP", onPress: () {}),
      body: FutureBuilder(
        future: provideData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error"),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return GridView.builder(
              itemCount: model?.length,
              itemBuilder: (ctx, index) {
                return GridCard(
                  id: model![index].id,
                  product: model![index].title.toString().substring(0, 12),
                  imgsource: model![index].image.toString(),
                  price: model![index].price.toString(),
                );
              },
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            );
          }
        },
      ),
    );
  }
}
