import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contenthome_controller.dart';

class ContenthomeView extends GetView<ContenthomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContenthomeView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContenthomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}