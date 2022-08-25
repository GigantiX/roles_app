import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contentcourse_controller.dart';

class ContentcourseView extends GetView<ContentcourseController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContentcourseView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContentcourseView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
