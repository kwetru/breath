import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home({Key? key}) : super (key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[900],
      appBar: AppBar(
        title: Text('Breath'),
        centerTitle: true,
      ),
        body: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 70),),
                    Text('Выберите режим тренировки', style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),),
                    Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 34)// put the width and height you want
                        ),
                        icon: Icon(Icons.add),
                        label: Text('Успокоение')

                    ),
                    Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 34)// put the width and height you want
                        ),
                        icon: Icon(Icons.add),
                        label: Text('Тонизирование')

                    ),
                    Padding(padding: EdgeInsets.only(top: 65),),
                    ElevatedButton.icon(onPressed: () {
                      Navigator.pushNamed(context, '/two');
                    },
                        style: ElevatedButton.styleFrom(
                            fixedSize: Size(200, 34)// put the width and height you want
                        ),
                        icon: Icon(Icons.add),
                        label: Text('Закаливание')

                    )
                  ],
                ),
              ],
            ),
        ),
    );

  }
}
