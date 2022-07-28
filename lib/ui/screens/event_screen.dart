import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ProgressBar();
  }
}

class _EventContent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blueAccent);
  }

}

class _ProgressBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return const SizedBox(
      child: LinearProgressIndicator(
        backgroundColor: Colors.blue,
        value: 1,
        minHeight: 20,
      ),
    );
  }
}
