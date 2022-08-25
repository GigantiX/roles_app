import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/content_home.controller.dart';

class ContentHomeScreen extends GetView<ContentHomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContentHomeScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContentHomeScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
