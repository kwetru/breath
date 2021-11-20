import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../pages/cubit/timer_cubit.dart';
import '../custom_painter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class TimerPage extends StatelessWidget {
 final int waitTime;
  const TimerPage({Key? key, required this.waitTime}):
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerCubit(waitTimeInSec: waitTime),
      child: const _TimerPage(),
    );
  }
}



class _TimerPage extends StatelessWidget {
  const _TimerPage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerState>(builder: (context, state) {
      if (state is TimerInitial) {
        return CustomPaint(
          painter: BackgroundSignIn(),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 85,
                          width: 85,
                          margin: const EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            value: state.percent,
                            backgroundColor: Colors.black,
                            strokeWidth: 8,
                          )),
                      Positioned(
                          child: Text(
                            state.waitTime,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                  Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        onPressed: () => context.read<TimerCubit>().startTimer(),
                        child: const Icon(Icons.play_circle_outline_sharp, size: 55),

                      )),
                ],
              )
          ),
        );
      }
      if (state is TimerRunState) {
        return CustomPaint(
          painter: BackgroundSignIn(),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        onPressed: () => context.read<TimerCubit>().restartTimer(),
                        child: const Icon(Icons.replay_circle_filled, size: 55),

                      )),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 85,
                          width: 85,
                          margin: const EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            value: state.percent,
                            backgroundColor: Colors.black,
                            strokeWidth: 8,
                          )),
                      Positioned(
                          child: Text(
                            state.currentTime,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                  Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        onPressed: () => context.read<TimerCubit>().pauseTimer(),
                        child: const Icon(Icons.pause_circle_outline, size: 55),

                      )),
                ],
              )
          ),
        );
      }
      if (state is TimerPauseState) {
        return CustomPaint(
          painter: BackgroundSignIn(),
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        onPressed: () => context.read<TimerCubit>().restartTimer(),
                        child: const Icon(Icons.replay_circle_filled, size: 55),

                      )),

                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          height: 85,
                          width: 85,
                          margin: const EdgeInsets.all(15),
                          child: CircularProgressIndicator(
                            value: state.percent,
                            backgroundColor: Colors.black,
                            strokeWidth: 8,
                          )),
                      Positioned(
                          child: Text(
                            state.currentTime,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.white, decoration: TextDecoration.none),
                            textAlign: TextAlign.center,
                          ))
                    ],
                  ),
                  Container(
                      height: 65,
                      width: 65,
                      margin: const EdgeInsets.all(15),
                      child: FloatingActionButton(
                        onPressed: () => context.read<TimerCubit>().startTimer(),
                        child: const Icon(Icons.play_circle_outline_sharp, size: 55),

                      )),
                ],
              )
          ),
        );
      }
      else {
        return Container();
      }

    }
    );
  }
}
class PraxisStudy extends StatefulWidget {
   const PraxisStudy({Key? key,}) : super(key: key);
   @override
   _PraxisState createState() => _PraxisState(); }

   class _PraxisState  extends State<PraxisStudy> {

     void initFirebase() async {
       WidgetsFlutterBinding.ensureInitialized();
       await Firebase.initializeApp();
     }

     @override
     void initState() {
       super.initState();

       initFirebase();
     }

     @override
     Widget build(BuildContext context) {
       // TODO: implement build
       throw UnimplementedError();
     }

  // @override
  // Widget build(BuildContext context) {
  // return StreamBuilder<QuerySnapshot>(
  // stream: FirebaseFirestore.instance.collection('praxis').snapshots(), }
  // );};
 }