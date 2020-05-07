import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Pakistan extends StatefulWidget {
  @override
  _PakistanState createState() => _PakistanState();
}

class _PakistanState extends State<Pakistan> {
  List countryData;
   Future getData() async{ 
     http.Response response = await http.get("https://corona.lmao.ninja/v2/countries");
      setState((){
        countryData = json.decode(response.body);
        print(countryData);
    });
     debugPrint(response.body);
   }
   @override
  void initState() {
    super.initState();
    getData();
  }
  
  showData(String data , String text, Color color){
    return Card( 
      child: Container(
                  height: 80.0,
                  child: Center(
                    child: Row( 
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[ 
                          Text('$text',
                          style: TextStyle( 
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              color:Colors.black54,
                            ),
                          ),
                          Text('${countryData[2][data]}',
                          style: TextStyle( 
                                color: color,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                            ),
                          ),
                        ]
                    ),
                  ),
                ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
            Container(
              height: 100.0,
              width: 100.0,
              child: Image.asset('images/flag.jpg'),
              ),
              SizedBox( 
                height: 5.0,
              ),
              Text('PAKISTAN',
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.grey[700],
                letterSpacing: 3,
                fontWeight: FontWeight.bold,
               ),
              ),
              SizedBox( 
                height: 20.0,
              ),
              Text(countryData[2]["country"]),
              showData('cases','Total Cases', Colors.purple),
              showData('deaths', 'Deaths', Colors.red),
              showData('recovered', 'Recovered', Colors.green),
              showData('active','Active Cases', Colors.blue),
              SizedBox(
                height: 15.0,
              ),
              Text('Stay Home, Stay Safe! ',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 15.0,
                color: Colors.grey[600],
                fontWeight: FontWeight.bold,
               ),
             ),
           ],
          ),
        ),
      ),
    );
  }
}