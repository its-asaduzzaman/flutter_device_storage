import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_device_storage/models/note_database.dart';
import 'package:provider/provider.dart';

import '../models/note.dart';

class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  //text controller to access what the user type
  final textController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //on app startup, fetch existing note
    readNote();
  }

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

              //clear the controller
              textController.clear();

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
  void readNote() {
    context.read<NoteDatabase>().fetchNotes();
  }

  //update a note

  //delete a note

  @override
  Widget build(BuildContext context) {
    //note database
    final noteDatabase = context.watch<NoteDatabase>();

    //current notes
    List<Note> currentNotes = noteDatabase.currentNote;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNote,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: currentNotes.length,
        itemBuilder: (context, index) {
          final note = currentNotes[index];
          return ListTile(
            title: Text(note.text),
          );
        },
      ),
    );
  }
}
