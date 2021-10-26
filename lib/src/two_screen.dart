import 'package:flutter/material.dart';

class Twoscreen extends StatelessWidget{
  const Twoscreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        appBar: AppBar(
        title: Text('Breath'),
    centerTitle: true,
    ),
      body:SafeArea(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 70),),
                  Text('Выберите длительность', style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                  ),),
                  Padding(padding: EdgeInsets.only(top: 55),),
                  ElevatedButton.icon(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 34)// put the width and height you want
                      ),
                      icon: Icon(Icons.add),
                      label: Text('1 минута')
                  ),
                  Padding(padding: EdgeInsets.only(top: 55),),
                  ElevatedButton.icon(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 34)// put the width and height you want
                      ),
                      icon: Icon(Icons.add),
                      label: Text('3 минуты')
                  ),
                  Padding(padding: EdgeInsets.only(top: 55),),
                  ElevatedButton.icon(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 34)// put the width and height you want
                      ),
                      icon: Icon(Icons.add),
                      label: Text('5 минут')
                  ),
                ],
              ),
            ]
          ),
      ),
    );
  }
}