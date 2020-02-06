import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meeting/main.dart';

class CreateNote extends StatefulWidget{

  final Function callback;
  CreateNote({this.callback});

  @override
  CreateNoteState createState() => CreateNoteState();

}

class CreateNoteState extends State<CreateNote>{

  final myController = TextEditingController();
  final myController1 = TextEditingController();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return BasePage(
      button: FloatingActionButton(
        onPressed: (){
          widget.callback(myController.text, myController1.text);
          Navigator.pop(context);
        },
        child: Icon(Icons.save_alt),
      ),
      title: "Create youtr note",
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