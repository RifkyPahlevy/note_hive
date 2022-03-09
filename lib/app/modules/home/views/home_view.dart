import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/app/routes/app_pages.dart';

import '../../../data/database/database.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Box<Notes>>(
          valueListenable: NoteManager.getAllNotes().listenable(),
          builder: (context, box, _) {
            List<Notes> notes = box.values.toList();
            if (notes.length == 0) {
              return Center(
                child: Text('Tidak Ada data'),
              );
            }
            return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                Notes note = notes[index];
                return ListTile(
                  onTap: () => Get.toNamed(Routes.EDIT_NOTE, arguments: note),
                  title: Text(note.judul!),
                  leading: CircleAvatar(
                    child: Text("${note.id!}"),
                  ),
                  subtitle: Text(note.deskripsi!),
                  trailing: IconButton(
                    onPressed: () => note.delete(),
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_NOTE),
        child: Icon(Icons.add),
      ),
    );
  }
}
