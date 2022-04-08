// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTX;
  NewTransaction(this.addTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titlecontroller = TextEditingController();

  final _amountcontroller = TextEditingController();

  DateTime? _selectedDate;
  String? _selectedtime;

  void _Submited() {

    if(_amountcontroller.text.isEmpty){
      return;
    }
    final enteredtitle = _titlecontroller.text;
    final enteredamount = double.parse(_amountcontroller.text);

  
    if (enteredtitle.isEmpty || enteredamount <= 0 || _selectedDate==null ||_selectedtime==null) {
      return;
    }


    widget.addTX(enteredtitle, enteredamount,_selectedDate,_selectedtime);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    ).then((pickedate) {
      if (pickedate == null) {
        return;
      }
      else{
        setState(() {
        _selectedDate = pickedate;
      });
      }
    });
  }

  void _presenTimepicker(){

    showTimePicker(context: context, initialTime:TimeOfDay.now()
    
     ).then((pictime){
      if(pictime==null){
        return;
      }

      else{
        setState(() {
          _selectedtime=pictime.format(context)
           ;
        });
      }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              
              decoration: InputDecoration(
                contentPadding:EdgeInsets.only(left: 20),
                enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(30)),
               borderSide: BorderSide(width: 1,color: Theme.of(context).primaryColor),),
                border: OutlineInputBorder(
                  

                  borderRadius: BorderRadius.circular(25)
                ),
                hintText: "      enter your title",
                 labelText:"     title"

              ),

              controller: _titlecontroller,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _Submited,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                contentPadding:EdgeInsets.only(left: 20),
                enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.all(Radius.circular(30)),
               borderSide: BorderSide(width: 1,color:Theme.of(context).primaryColor),),
                 border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)
                ),
                hintText: "      Enter your amount",
                labelText:"      amount"
              ),
              controller: _amountcontroller,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _Submited,

            ),



            Container(
              height: 110,
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        fit: FlexFit.tight,
                        child:  Text(
                              _selectedDate == null
                                  ? "No date chosen !"
                                  : "Picker Date: ${DateFormat.yMMMMd().format(_selectedDate!)}",
                              style: TextStyle(color: Colors.black),
                            )),
                      
                      TextButton(
                          onPressed: _presentDatePicker,
                          child: Text(
                            "Date chose",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),


                          SizedBox(height: 2,),
                           
                    ],
                  ),

                 Row(children: [
                     Flexible(
                        fit: FlexFit.tight,
                        child:  Text(
                              _selectedtime == null
                                  ? "No Time chosen !"
                                  : "Picker Date: ${_selectedtime}",
                              style: TextStyle(color: Colors.black),
                            )),
                      
                      TextButton(
                          onPressed: _presenTimepicker,
                          child: Text(
                            "Time chose",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                 ],)
                ],
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    _Submited();
                  },
                  child: Text(
                    "Add Transaction",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
