import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_note_controller.dart';

class AddNoteView extends GetView<AddNoteController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddNoteView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.judulC,
            decoration: InputDecoration(
              labelText: 'judul',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            controller: controller.desC,
            decoration: InputDecoration(
              labelText: 'deskripsi',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.isLoading.isFalse) {
                controller.addNote();
                Get.back();
              }
            },
            child: Text("Tambah"),
          )
        ],
      ),
    );
  }
}
