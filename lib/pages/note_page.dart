import 'package:flutter/material.dart';
import 'package:flutter_device_storage/models/note_database.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    //text controller to access what the user type
    final textController = TextEditingController();

    //create note
    void createNote() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: TextField(
            controller: textController,
          ),
          actions: [
            //create button
            MaterialButton(
              onPressed: () {
                //added to the db
                context.read<NoteDatabase>().addNote(textController.text);

                //pop dialog box
                Navigator.pop(context);
              },
              child: const Text("create"),
            ),
          ],
        ),
      );
    }

    //read note

    //update a note

    //delete a note

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
    );
  }
}
