import 'package:breath/src/pages/timer_page.dart';
import 'package:flutter/material.dart';
import '../src/custom_painter.dart';

class Twoscreen extends StatelessWidget{
  const Twoscreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        appBar: AppBar(
        title: Text('Breath Application', style: const TextStyle(color: Colors.black87)),
    centerTitle: true,
    ),
      body:CustomPaint(
        painter: BackgroundSignIn(),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                      const Padding(padding: EdgeInsets.only(top: 70),),
                      const Text('Выберите длительность', style: TextStyle(
                        fontSize: 25,
                        color: Colors.black38,
                        fontFamily: "ZenKurenaido",
                      ),),
                      Padding(padding: EdgeInsets.only(top: 55),),
                      ElevatedButton.icon(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerPage(waitTime: 60)));
                        //почему он не видит context блин? Лиза, чекни это потом
                      },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 34)// put the width and height you want
                          ),
                          icon: Icon(Icons.add),
                          label: Text('1 минута', style: TextStyle(
                            fontSize: 21,
                            fontFamily: "ZenKurenaido",
                          ),)
                      ),
                      Padding(padding: EdgeInsets.only(top: 55),),
                      ElevatedButton.icon(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerPage(waitTime: 180)));
                      },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 34)// put the width and height you want
                          ),
                          icon: Icon(Icons.add),
                          label: Text('3 минуты', style: TextStyle(
                            fontSize: 21,
                            fontFamily: "ZenKurenaido",
                          ),)
                      ),
                      Padding(padding: EdgeInsets.only(top: 55),),
                      ElevatedButton.icon(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TimerPage(waitTime: 300)));
                      },
                          style: ElevatedButton.styleFrom(
                              fixedSize: Size(200, 34)// put the width and height you want
                          ),
                          icon: Icon(Icons.add),
                          label: Text('5 минут', style: TextStyle(
                            fontSize: 21,
                            fontFamily: "ZenKurenaido",
                          ),)
                      ),
                    ],
                  ),
                ],
              ),
          ),
    );
  }
}
