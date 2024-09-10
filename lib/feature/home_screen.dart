import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
         body: Column(
           children: [
             const Center(
               child: Text('Welcome to Flutter App'),
             ),
             ElevatedButton(
               onPressed: () {
                 // Navigate to a new screen
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
               },
               child: Text('Go to Second Screen'),
             ),
           ],
         ),
      );
  }
}
