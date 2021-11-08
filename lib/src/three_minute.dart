import 'package:flutter/material.dart';
import 'package:breath/src/timer1minute.dart';

void main() {
  runApp(const Ill());
}

class Ill extends StatelessWidget {
  const Ill({Key? key}) : super(key: key);

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
          title: const Text("three minutes timer", style: TextStyle(
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
