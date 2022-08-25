import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contentprofile_controller.dart';

class ContentprofileView extends GetView<ContentprofileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ContentprofileView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ContentprofileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
