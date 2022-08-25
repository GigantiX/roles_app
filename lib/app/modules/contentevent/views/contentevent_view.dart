import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contentevent_controller.dart';

class ContenteventView extends GetView<ContenteventController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContenteventView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContenteventView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
