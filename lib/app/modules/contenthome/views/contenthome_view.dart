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

        ),
      )
    );
  }
}
