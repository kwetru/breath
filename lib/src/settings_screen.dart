import 'package:flutter/material.dart';
import '../src/custom_painter.dart';

class Settingsscreen extends StatelessWidget{
  const Settingsscreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        title: const Text('Breath Application', style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body:CustomPaint(
        painter: BackgroundSignIn(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Padding(padding: EdgeInsets.only(top: 70),),
                  Text('Настройки приложения', style: TextStyle(
                    fontSize: 25,
                    color: Colors.black38,
                    fontFamily: "ZenKurenaido",
                  ),),
                  Padding(padding: EdgeInsets.only(top: 55),),
                  ElevatedButton.icon(onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 34)// put the width and height you want
                      ),
                      icon: Icon(Icons.add),
                      label: Text('Темная тема', style: TextStyle(
                        fontSize: 21,
                        fontFamily: "ZenKurenaido",
                      ),)
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}
