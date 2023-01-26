import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUs extends StatefulWidget {


  State<StatefulWidget> createState() {
    return _aboutcreen();
  }
}

class _aboutcreen extends State<AboutUs> {
  String about = 'Debo Engineering is an integrated engineering discipline organization based on recently emerging technologies such as Artificial Intelligence, Machine Learning (ML), Internet of things (IOT), Image Processing, Big Data analysis, Mobile computing and any field related to engineering. We design, analyze, develop and implement smart business applications, solution for any problems those need Digital solution for agriculture, health, education, transportation, and other sectors.';

  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 233, 222, 229),
      
        body: Center(

          
child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
SizedBox(height: MediaQuery.of(context).size.height*0.0175438,),
              Container(
               height: MediaQuery.of(context).size.height*0.3,
               width: MediaQuery.of(context).size.width*0.7,

                 
                 child: Image(image: AssetImage( 'assets/cover/images/debo_logo.png')),
                          
                          
                          ),
                        


    Container(
 
              
               margin: const EdgeInsets.all(20.0),
               height: MediaQuery.of(context).size.height*0.6,
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
                  child: Text(textAlign: TextAlign.justify,about, style:GoogleFonts.lato(fontStyle: FontStyle.italic, fontSize: MediaQuery.of(context).size.height*0.03)),
                ),
              
),
        
        ],
      ),

          



        ));
  }
}
