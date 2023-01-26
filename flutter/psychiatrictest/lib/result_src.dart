import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatefulWidget {
  final String _desease;
  final String _sugesion;
  final int _count;
  int i;
  ResultScreen(this._desease, this._sugesion, this.i, this._count);

  State<StatefulWidget> createState() {
    return _resultscreen();
  }
}

class _resultscreen extends State<ResultScreen> {
 
  @override
  @override
  Widget build(BuildContext context) {
    String _desease = widget._desease;
    String _sugesion = widget._sugesion;
    int _count = widget._count;
    int i = widget.i;
    i = 0;
    setState(() {
      if(_count < 22){
 _desease = 'undefined'; // this is to handle if the user click the result button before answering all questions.
      _sugesion = 'You have to answer all of the questions';
      }
     
    });
    return Scaffold(
        backgroundColor: Color.fromRGBO(132, 218, 209, 1),
       
        body: Center(
          child: Column(
            
          
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
             
              Container(
                width: MediaQuery.of(context).size.width*0.9375,
                height: MediaQuery.of(context).size.height*0.2105,
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 212, 212),
                  border: Border.all(
                    color: Color.fromARGB(255, 160, 160, 160),
                    width: MediaQuery.of(context).size.width*0.040625,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Text(
                  'Type of Disorder: $_desease ',
                  style: GoogleFonts.lato(
                      fontSize: MediaQuery.of(context).size.height*0.033,
                      fontWeight: FontWeight.bold,
                      fontStyle:FontStyle.italic,
                      decorationThickness: 3),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height*0.01754),

              ////// result detail container
              Container(
                width:  MediaQuery.of(context).size.width*0.84375,
                height: MediaQuery.of(context).size.height*0.6,
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 212, 212),
                  border: Border.all(
                    color: Color.fromARGB(255, 3, 3, 3),
                    width: 0.0,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text(_sugesion,textAlign: TextAlign.justify, style: GoogleFonts.lato(fontSize: MediaQuery.of(context).size.height*0.033, fontStyle: FontStyle.italic),),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.01754),

              ///
            ],
          ),
        ));
  }
}

