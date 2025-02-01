
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
 static String route() => "/";

  const SplashPage({ super.key });

   @override
   Widget build(BuildContext context) {
       return Scaffold(
        
        backgroundColor: Colors.deepPurple,
           body: Center(
               child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                       const CircularProgressIndicator(),
                       const SizedBox(height: 20),
                       const Text('Loading...', style: TextStyle(color: Colors.white),),
                             
                   ],
               ),
              
           ),
       );
  }
}