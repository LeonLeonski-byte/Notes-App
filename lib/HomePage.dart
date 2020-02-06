import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting/main.dart';
import 'package:meeting/CreateNote.dart';
import 'package:meeting/EditNote.dart';
import 'package:meeting/Note.dart';

class HomePage extends StatefulWidget{
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{
  List<Widget> notesList = [];

  List<Note> notes = [];

  void loadNotes(String title, String subtitle){
    Note n = Note(title, subtitle);

    setState(() {
      notes = List.from(notes)..add(n);
      //notesList = List.from(notesList)..add(noteCard(n, context, updateNote));
    });
  }

  List<Widget> getNotes(){
    debugPrint("$notes");
    debugPrint("$notesList");
    notesList.clear();
    for(Note n in notes){
      setState(() {
        notesList = List.from(notesList)..add(noteCard(n, context, updateNote));
      });

    }
    return notesList;
  }

  void updateNote(String title, String subtitle, Note note){
    setState(() {
      note.title = title;
      note.subtitle = subtitle;
    });
  }


  @override
  Widget build(BuildContext context) {
    //loadNotes("adasd", "asdad");
    return  BasePage(
      title: "Mini Notes",
      button: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder:(context) => CreateNote(callback: loadNotes)));
        },
      ),
      child: notes.length == 0 ? Container(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
        child: Text("Du hast noch keine Notizen.", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),),
      ): Container(
        child: ListView(
          physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0),
          children: /*[
            Container(
                child: Text(i.toString())
            )
          ]*/
          getNotes()
        ),
      )
    );
  }
}


Widget noteCard(Note note, context, callback){
  debugPrint("de title isch: ${note.title}");
  return Container(
    margin: EdgeInsets.only(bottom: 20.0),
    child: GestureDetector(
      onTap: (){
        debugPrint("hallooo");
        Navigator.push(context, MaterialPageRoute(builder:(_)=> EditNote(callback: callback, note: note,)));
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 5, right: 10),
              child: Text(note.title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.0), maxLines: 1, overflow: TextOverflow.ellipsis, ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, right: 10, bottom: 5),
              child: note.subtitle == null ? Container :  Text(note.subtitle, style: TextStyle(color: Colors.grey, fontSize: 18.0, fontWeight: FontWeight.w700),  maxLines: 2, overflow: TextOverflow.ellipsis,),
            )
          ],
        ),
      ),
    )

  );
}
