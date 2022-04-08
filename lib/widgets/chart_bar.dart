

import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
 
 final String label;
 final double spendingAmount;
 final double spendingpctTotal;


 CharBar(this.label,this.spendingAmount,this.spendingpctTotal);



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [

        Container(
          height: 20,
          child: FittedBox(child: Text("\$${spendingAmount.toStringAsFixed(0)}"))),

        SizedBox(height: 4,),

       Container(
         height: 60,
         width: 10,
         child: Stack(
           alignment: Alignment.bottomCenter,
           children: [
           Container(
             
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey,width: 2),
              color: Colors.grey,
               borderRadius: BorderRadius.circular(10),
            ),
           ),
         FractionallySizedBox(
             heightFactor: spendingpctTotal,
             child: Container(
               decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor,
                 borderRadius: BorderRadius.circular(10)
               ),
             ),
             )

         ]),
       ),
       SizedBox(height:4),

       Text(label),







      ],
      
    );
  }
}