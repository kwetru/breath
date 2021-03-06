import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import '../custom_painter.dart';
import 'timer_page.dart';

class Durationscreen extends StatelessWidget {
  final int mode;
  const Durationscreen({required this.mode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        title: const Text('Breath Application',
            style: TextStyle(color: Colors.black87)),
        centerTitle: true,
      ),
      body: CustomPaint(
        painter: BackgroundSignIn(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 70),
                ),
                const Text(
                  'Выберите длительность',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black38,
                    fontFamily: "ZenKurenaido",
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 55),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TimerPage(
                                    waitTime: 60,
                                    mode: mode,
                                  )));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(
                            200, 34) // put the width and height you want
                        ),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      '1 минута',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "ZenKurenaido",
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 55),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TimerPage(waitTime: 180, mode: mode)));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(
                            200, 34) // put the width and height you want
                        ),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      '3 минуты',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "ZenKurenaido",
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(top: 55),
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TimerPage(waitTime: 300, mode: mode)));
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(
                            200, 34) // put the width and height you want
                        ),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      '5 минут',
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "ZenKurenaido",
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
