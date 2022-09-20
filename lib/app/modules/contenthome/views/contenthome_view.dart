import 'package:approle/color_pack.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/contenthome_controller.dart';

class ContenthomeView extends GetView<ContenthomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: DraggableHome(
          title: Image.asset('assets/images/DiviAcaHrznBlck.png',
          height: 17,
          ),
          backgroundColor: Colors.white,
          appBarColor: CoWhiteGrey,
          fullyStretchable: false,
          curvedBodyRadius: 0,
          actions: [
            SizedBox(
              height: 35,
              width: 35,
              child: ElevatedButton(
                onPressed: () {},
                child: Icon(Icons.settings,
                    color: Colors.black,
                  size: 15,
                ),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(10),
                  primary: Colors.white, // <-- Button color
                  onPrimary: Colors.blueGrey, // <-- Splash color
                ),
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
          alwaysShowLeadingAndAction: true,
          headerWidget: Container(
            height: 150,
            width: double.infinity,
            color: CoWhiteGrey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Image.asset(
                      'assets/images/DiviAcaHrznBlck.png',
                      height: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),

          body: [
              ListView.builder(
              padding: const EdgeInsets.only(top: 0),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 20,
              shrinkWrap: true,
              itemBuilder: (context, index) => Card(
                color: Colors.white70,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text("$index"),
                  ),
                  title: const Text("Title"),
                  subtitle: const Text("Subtitile"),
                ),
              ),
            )
          ],

        ),
      )
    );
  }
}
