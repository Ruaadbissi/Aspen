import 'package:aspen/navbar/navBar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';


class homeScreen extends StatelessWidget {
  const homeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
          Image.asset("assets/img.png",
              fit: BoxFit.fill,
            width: 100.w,
            height: 100.h,
           ),
              Positioned(
                  top: 95,
                    right: 25,
                    left: 25,
                    child: Image.asset(
                      'assets/logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
              Positioned(
                  bottom: 14.h,
                  child: Container(
                    margin:const EdgeInsets.only(left: 40),
                    child: RichText(
                      text:const TextSpan(
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.w400,
                        height: 1.1,
                      ),
                    children:[
                      TextSpan(
                       text: 'Plan your',
                       style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        height: 2,
                      ),
                    ),
                        TextSpan(
                          text: " \n",
                     ),
                      TextSpan(
                       text: 'Luxurious \nVacation',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 1,
                      ),
                    ),
                   ]
                  ),
                  ),
                  ),
              ),
                      Positioned(
                          top: 90.h,
                          left: 25,
                          right: 25,
                          child:ElevatedButton(
                          onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NavBarCode()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),

                        ),
                           child: const Text('Explore',style: TextStyle(
                          fontSize: 20,
                        )
                       ),
                      ),
              ),
            ]
          ),
      )
    );
  }
}
