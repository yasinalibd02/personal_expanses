
import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/chart.dart';
import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<TransactionModel> _userTransactions = [
    
    // TransactionModel("1", "Shirt", 1400, DateTime.now()),
    // TransactionModel("2", "pant", 1100, DateTime.now()),
    // TransactionModel("3", "shoes", 700.99, DateTime.now()),
  ];
  
    List<TransactionModel>  get _recentTransaction{
      return _userTransactions.where((test){
        return test.date.isAfter(DateTime.now().subtract(Duration(days: 7),),
        
        );
      }).toList();
 }

  void _addNewTransaction(String TXtitle,double TXamount, DateTime chosendate,String selectime )
  {

    final NewTx=TransactionModel(
      
      time:selectime , 
    id: DateTime.now().toString(), title: TXtitle, amount: TXamount, date: chosendate);
    setState(() {
      _userTransactions.add(NewTx);
    });

  }


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx, builder: (_){
      return GestureDetector(child: NewTransaction(_addNewTransaction),
      behavior: HitTestBehavior.opaque,);
    });
  }

  void _deleteTransaction(String id){
    setState(() {
      _userTransactions.removeWhere((element){
        return element.id==id;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text("Flutter App")),
        actions: [
           IconButton(onPressed: () => _startAddNewTransaction(context), 
           
           
           
           icon: Icon(Icons.add))
        ],
        ),
       body: ListView(
         children: [
       
          
            Chart(_recentTransaction),
           TransactionList(_userTransactions,_deleteTransaction,)
               
       
            
         ]
         ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(onPressed: 
             ()=> _startAddNewTransaction(context)
          ,child: Icon(Icons.add),),
    );
  }
}
