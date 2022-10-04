import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setprofile_controller.dart';

class SetprofileView extends GetView<SetprofileController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: "Name"
                ),
                controller: controller.nameC,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () =>controller.setName(controller.nameC.text),
                  child: Text('Done')
              ),
            ],
          ),
        ),
      )
    );
  }
}
