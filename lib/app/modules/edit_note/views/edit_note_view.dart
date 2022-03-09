import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/database/database.dart';
import '../controllers/edit_note_controller.dart';

class EditNoteView extends GetView<EditNoteController> {
  Notes note = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.juduC.text = note.judul!;
    controller.desC.text = note.deskripsi!;
    return Scaffold(
      appBar: AppBar(
        title: Text('EditNoteView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: controller.juduC,
            decoration: InputDecoration(
              labelText: 'Title',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: controller.desC,
            decoration: InputDecoration(
              labelText: 'Description',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () async {
                if (controller.isLoading.isFalse) {
                  await controller.editNote(note);
                  Get.back();
                }
              },
              child: Text("edit"))
        ],
      ),
    );
  }
}
