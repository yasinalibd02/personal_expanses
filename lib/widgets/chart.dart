import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logical4/models/transaction.dart';

import 'chart_bar.dart';

class Chart extends StatelessWidget {

  List<TransactionModel> recentTransaxtion;

  Chart(this.recentTransaxtion);

 List<Map<String,dynamic>> get groupedTransactionValues{
    return List.generate(7, (index){ 

      final weekDay=DateTime.now().subtract(Duration(days:index,));

      var totalsum=0.0;


      for(var i=0; i<recentTransaxtion.length; i++){
        if(recentTransaxtion[i].date.day==weekDay.day &&
           recentTransaxtion[i].date.month==weekDay.month &&
           recentTransaxtion[i].date.year==weekDay.year
        ){
            totalsum  += recentTransaxtion[i].amount;
       }
      }
      
      

     return {"day":DateFormat.E().format(weekDay).substring(0,1),
             "amount":totalsum};
    }
    
    ).reversed.toList();

    
 }


 double get totalSpending {
   return groupedTransactionValues.fold(0.0, (sum, item){
  return sum + item ["amount"]; 

   });

 }

  @override
  Widget build(BuildContext context) {

    
   

 

    return Card(
      elevation: 5,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          
          children: groupedTransactionValues.map((data){
            return Flexible(
              fit: FlexFit.loose,
              child: CharBar(
                data["day"] ,
                data["amount"],
                
              totalSpending==0.0?0.0 : (data["amount"] as double)/totalSpending),
            );
        
          
          
         } ).toList()
          
          ),
      )
      
    );
  }
}