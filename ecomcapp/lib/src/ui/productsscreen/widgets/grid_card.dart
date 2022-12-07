import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../utils/constants.dart';

class GridCard extends StatelessWidget {
  String product;
  String price;
  String imgsource;
  final id;
  GridCard(
      {required this.product,
      required this.price,
      required this.imgsource,
      required this.id});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.productdes,
        );
      },
      child: Card(
        color: Colors.blueGrey[200],
        elevation: 5,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  alignment: Alignment.center,
                  child: Text(
                    product,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.network(imgsource,
                        height: 100, width: 120, fit: BoxFit.fill)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(price,
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
