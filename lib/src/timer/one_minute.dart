import 'package:flutter/material.dart';
import 'package:breath/src/timer/timer1minute.dart';

void main() {
  runApp(const OneMinuteTime());
}

class OneMinuteTime extends StatelessWidget {
  const OneMinuteTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateWidget(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    final provider = TimerInheritedWidget.of(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("one minute timer", style: TextStyle(
            fontSize: 25,
            color: Colors.black38,
            fontFamily: "ZenKurenaido",
          ),),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 65,
                  width: 65,
                  margin: const EdgeInsets.all(15),
                  child: FloatingActionButton(
                    onPressed: () {
                      provider?.restart();
                    },
                    child: const Icon(Icons.restart_alt_outlined, size: 55),
                  )),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                      height: 85,
                      width: 85,
                      margin: const EdgeInsets.all(15),
                      child: CircularProgressIndicator(
                        value: provider?.percent,
                        backgroundColor: Colors.black87,
                        strokeWidth: 8,
                      )),
                  Positioned(
                      child: Text(
                        "${provider?.timeStr}",
                        style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                        textAlign: TextAlign.center,
                      ))
                ],
              ),
              Container(
                  height: 65,
                  width: 65,
                  margin: const EdgeInsets.all(15),
                  child: FloatingActionButton(
                    onPressed: () {
                      provider!.isStart ? provider.pause() : provider.start(context);
                    },
                    child: provider!.isStart
                        ? const Icon(Icons.pause_circle_outline, size: 55)
                        : const Icon(Icons.play_circle_outline_sharp, size: 55),
                  )),
            ],
          ),
        ));
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
