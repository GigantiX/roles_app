import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contenthome_controller.dart';

class ContenthomeView extends GetView<ContenthomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height: 10
              ),
              Container(
                // color: Colors.black,
                decoration: BoxDecoration(
                  border: Border.all(width: 1)
                ),
                width: double.infinity,
                height: 55,
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Image.asset(
                      'assets/images/DiviAcaHrznBlck.png',
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
