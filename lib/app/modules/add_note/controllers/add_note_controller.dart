import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/database/database.dart';

class AddNoteController extends GetxController {
  TextEditingController judulC = TextEditingController();
  TextEditingController desC = TextEditingController();

  RxBool isLoading = false.obs;

  void addNote() async {
    if (judulC.text.isNotEmpty && desC.text.isNotEmpty) {
      isLoading.value = true;
      Notes note = Notes()
        ..judul = judulC.text
        ..deskripsi = desC.text;

      final box = NoteManager.getAllNotes();
      int id = await box.add(note);
      note.id = id;
      note.save();
    }
  }
}
