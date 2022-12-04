import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GridCard extends StatelessWidget {
  String product;
  DateTime date;
  String desciption;
  String imgsource;
  GridCard({required this.product, required this.date, required this.desciption,required this.imgsource});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: Colors.indigo[900],
        elevation: 5,
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    product,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,color: Colors.white70),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(imgsource,height: 60,width: 100,fit: BoxFit.fill)
                ),
                Container(

                  child: Text(
                    desciption,
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.white54),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    DateFormat.yMMMd().format(date),
                    style:
                    TextStyle(fontSize: 14, fontWeight: FontWeight.w600,color: Colors.white38),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}