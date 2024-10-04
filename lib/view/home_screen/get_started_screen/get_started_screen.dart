// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_product_cart_app/view/home_screen/home_screen.dart';


class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/c6/cb/b4/c6cbb4c1da59c00bf6dffa19d33d3df1.jpg"))),
        )),
        Padding(
          padding: const EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Get Started",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}