import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                'Profile Picture',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GetBuilder<SetprofileController>(
                  builder: (c) =>c.image != null
                      ? Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: FileImage(
                          File(c.image!.path),
                        ),
                        fit: BoxFit.cover
                      ),
                    ),
                  )
                      : Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2),
                        borderRadius: BorderRadius.circular(100)
                    ),
                        child: Center(child: Text('No Image')),
                  ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () => controller.selectImage(),
                      child: Text('Choose')
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text('Upload')
                  ),
                ],
              ),
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
