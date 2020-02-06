import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting/main.dart';
import 'package:meeting/Note.dart';

class EditNote extends StatefulWidget{

  final Note note;
  final Function callback;
  EditNote({this.note, this.callback});

  @override
  EditNoteState createState() => EditNoteState();

}

class EditNoteState extends State<EditNote>{

  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  void initState() {
    myController.value = (TextEditingValue(text: widget.note.title ?? ""));
    myController1.value = (TextEditingValue(text: widget.note.subtitle ?? ""));
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BasePage(
      button: FloatingActionButton(
        onPressed: (){
          widget.callback(myController.text, myController1.text, widget.note);
          Navigator.pop(context);
        },
        child: Icon(Icons.save_alt),
      ),
      title: "Edit youtr note",
      child: Container(
        margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Text("Title", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.0),),
            ),
            TextField(
              controller: myController,

              decoration: InputDecoration(
                //border: InputBorder.none,
                  hintText: 'Enter a search term'
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Text("Your Content", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24.0),),
            ),
            Expanded(
              child: TextField(
                minLines: null,
                maxLines: null,
                expands: true,
                controller: myController1,
                decoration: InputDecoration(
                  //border: InputBorder.none,
                    hintText: 'Enter a search term'
                ),
              ),
            )

          ],
        ),
      ),
    );
  }

}