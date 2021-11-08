import 'package:flutter/material.dart';

class Twoscreen extends StatelessWidget{
  const Twoscreen({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext) {
    return Scaffold(
        backgroundColor: Colors.cyan[900],
        appBar: AppBar(
        title: Text('Breath Application', style: TextStyle(color: Colors.black87)),
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
                      Text('Выберите длительность', style: TextStyle(
                        fontSize: 25,
                        color: Colors.black38,
                        fontFamily: "ZenKurenaido",
                      ),),
                      Padding(padding: EdgeInsets.only(top: 55),),
                      ElevatedButton.icon(onPressed: () {
                        //Navigator.pushNamed(context, '/one_minute');
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
                      ElevatedButton.icon(onPressed: () {},
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
                      ElevatedButton.icon(onPressed: () {},
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
class BackgroundSignIn extends CustomPainter{
  @override
  void paint (Canvas canvas, Size size){
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.grey.shade100;
    canvas.drawPath(mainBackground, paint);

    //Blue
    Path blueWave = Path();
    blueWave.lineTo(sw, 0);
    blueWave.lineTo(sw, sh*0.5);
    blueWave.quadraticBezierTo(sw*0.5, sh*0.45, sw*0.2, 0);
    blueWave.close();
    paint.color = Colors.blue.shade300;
    canvas.drawPath(blueWave, paint);

    //Green
    Path greenWave = Path();
    greenWave.lineTo(0, sh);
    greenWave.lineTo(sw, sh);
    greenWave.cubicTo(sw*0.87, sh*0.45, sw*0.65, sh*0.55, sw*0.36, sh*0.38 );
    greenWave.cubicTo(sw*0.52, sh*0.52, sw*0.15, sh*0.15, 0, sh*0.4);

    greenWave.close();
    paint.color = Colors.greenAccent.shade200;
    canvas.drawPath(greenWave, paint);

  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return oldDelegate != this;
  }
}
