import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpScreen extends StatefulWidget {


  State<StatefulWidget> createState() {
    return _helpscreen();
  }
}

class _helpscreen extends State<HelpScreen> {
  String help = 'This application is a psychiatric artificial intelligence application that determines whether you have mental disorder or not. It should be noted that there are numerous and different types of mental disorders and this application is used to test some of them and which are common to many peoples. After getting started answer all yes/no questions. When you are done, click on result button to view your test result. You will then obtain a detailed report of your results along with some recommendations. We appreciate your use of our application.' ;

  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor:  Color.fromARGB(255, 233, 222, 229),
      
        body: Center(
          

child: Container(
 
              
               margin: const EdgeInsets.all(20.0),
               height: MediaQuery.of(context).size.height*0.8,
                padding: const EdgeInsets.all(10.0),
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
                  child: Text(help, textAlign: TextAlign.justify,style:GoogleFonts.lato(fontStyle: FontStyle.italic,fontSize: MediaQuery.of(context).size.height*0.03)),
                ),
              
),


        ));
  }
}

