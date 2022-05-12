


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {

  int personCount =1;
  double totalbill = 0.0;
  double tippercent =0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [



          Container(
            height: 200,
            width: 50,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1 , left: 20 , right: 20),
            padding: EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18.0),
                color: Colors.lightBlueAccent.withOpacity(0.1),
                border: Border.all(
                    color: Colors.lightBlueAccent.withOpacity(0.1),
                    width: 3,
                    style: BorderStyle.solid
                )
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bill Per Person" ,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.lightBlue,
                    ),
                  ),
                  Text("\$ ${(((totalbill+(totalbill*tippercent)/100))/personCount).round()}" ,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30 , right: 10 , left: 10),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(18.0),
                border: Border.all(
                    color: Colors.black26.withOpacity(0.2),
                    width: 1,
                    style: BorderStyle.solid
                )
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                  decoration: InputDecoration(
                    prefixText: "Bill amount : ",
                    prefixStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  onChanged: (String value)
                  {
                    setState(() {
                      totalbill = double.parse(value);
                    });
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Split: " ,style: TextStyle(color: Colors.black45, fontSize: 18) ),
                    Container(
                      alignment: Alignment.center,
                      //margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(15),
                      child: Row(
                        children: [

                             InkWell(
                                child: Container(
                                    child: Text("-" , style: TextStyle(color: Colors.lightBlue, fontSize: 20 , fontWeight: FontWeight.bold), ),
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),


                              onTap: (){
                                  setState(() {
                                    if(personCount>1)
                                      {
                                        personCount--;
                                      }
                                    else
                                      {
                                        personCount = 1;
                                      }
                                  });
                              },
                            ),
                            

                          Container(
                            padding: EdgeInsets.all(20),

                            child: Text(personCount.toString() , style: TextStyle(color: Colors.lightBlue,fontSize: 20 , fontWeight: FontWeight.bold),),
                          ),
                          InkWell(
                                child: Container(
                                    child: Text("+" , style: TextStyle(color: Colors.lightBlue, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  width: 50,
                                  height: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.lightBlueAccent.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              onTap: (){
                                  setState(() {
                                    personCount++;
                                  });
                              },
                            ),
                        ],
                      ),
                    )
                  ],
                ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("Tip: " ,style: TextStyle(color: Colors.black45, fontSize: 18) ),
                  Padding(
                    padding: const EdgeInsets.only(right: 13),
                    child: Text("\$ ${(totalbill*tippercent)/100}" ,style: TextStyle(color: Colors.lightBlue, fontSize: 23, fontWeight: FontWeight.bold) ),
                  ),
                ],
              ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("$tippercent\%" ,style: TextStyle(color: Colors.lightBlue, fontSize: 19, fontWeight: FontWeight.bold) ),
                    Slider(
                        min: 0.0,
                        max: 100,
                        value: tippercent,
                        onChanged: (double value){
                      setState(() {
                        tippercent = value.round().toDouble();
                      });
                    })
                  ],
                )
              ],

            ),

          )
        ],
      ),



    );
  }
}
