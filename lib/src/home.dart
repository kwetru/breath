import 'package:flutter/material.dart';
import 'custom_painter.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super (key: key);

  @override
  State<Home> createState() => _HomeState();
}



class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Breath Application', style: TextStyle(color: Colors.black87),),
      ),
        body: CustomPaint(
          painter: BackgroundSignIn(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.only(top: 70),),
                    const Text('Выберите режим тренировки', style: TextStyle(
                      fontSize: 28,
                      fontStyle: FontStyle.italic,
                      color: Colors.black38,
                      fontFamily: "ZenKurenaido",
                    ),),
                    const Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 34)// put the width and height you want
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text('Успокоение', style: TextStyle(
                          fontSize: 21,
                          fontFamily: "ZenKurenaido",
                        ),),

                    ),
                    const Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 34)// put the width and height you want
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text('Тонизирование', style: TextStyle(
                          fontSize: 21,
                          fontFamily: "ZenKurenaido",
                        ),)

                    ),
                    const Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(200, 34)// put the width and height you want
                        ),
                        icon: const Icon(Icons.add),
                        label: const Text('Закаливание', style: TextStyle(
                          fontSize: 21,
                          fontFamily: "ZenKurenaido",
                        ),),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/settings');
                    },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 34)// put the width and height you want
                      ),
                      icon: const Icon(Icons.settings),
                      label: const Text('Настройки', style: TextStyle(
                        fontSize: 21,
                        fontFamily: "ZenKurenaido",
                      ),),

                    ),
                  ],
                ),
              ],
            ),
        ),
    );

  }
}
