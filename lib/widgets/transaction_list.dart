import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionModel> transaction;

   Function deleteicon;
  TransactionList(this.transaction,this.deleteicon);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
       
      child: transaction.isEmpty
          ? Column(
              children: [
                Center(
                  child: Text(
                    "No Task Here,Please Add Data",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Container(
                  height: 320,
                  
                  
                  child: Image.asset("images/task.png")),
              ],
            )
          : ListView.builder(
              itemCount: transaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  shadowColor: Colors.deepPurple,
                  margin: EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                  child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: FittedBox(child: Text("\$ ${transaction[index].amount}")),
                        ),
               ),


               title: Text(transaction[index].title,
               style: Theme.of(context).textTheme.titleLarge,),
 

               subtitle: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(DateFormat.yMMMMd().format(transaction[index].date),),
                    Text(transaction[index].time)
                 ],
               ),
                trailing: IconButton(
                  color:Colors.red,
                  icon: Icon(Icons.delete,size: 28,),onPressed:(){deleteicon(transaction[index].id);},),


                  ),
                  
                  );
              }),
    );
  }
}
