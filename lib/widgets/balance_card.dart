import 'package:crypto_app/theme/colors.dart';
import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  BalanceCard({ Key? key, required this.cardData}) : super(key: key);
  final cardData;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          // color: primary.withOpacity(.4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.1, 0.9],
            colors: [
              primary.withOpacity(.4),
              primary.withOpacity(.7),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Balance", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
            SizedBox(height: 5,),
            Text(cardData["balance"], maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Monthly profit", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                    SizedBox(height: 5,),
                    Text(cardData["profit"], maxLines: 1, overflow: TextOverflow.fade, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 3, right: 3),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_drop_up_sharp),
                      Text(cardData["change"], style: TextStyle(fontSize: 10,),),
                    ],
                  ),
                )
              ],
            ),
        ],
        )
      );
  }
}
