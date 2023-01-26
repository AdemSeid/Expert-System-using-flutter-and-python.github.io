import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exf/help.dart';
import  'package:exf/about_us.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        
        padding: EdgeInsets.zero,
        
        children: <Widget>[
          DrawerHeader(
            
             child: Text('',
                                style: GoogleFonts.lato(
                                  fontStyle: FontStyle.italic,
                                  fontSize:  MediaQuery.of(context).size.height*0.02982,),
                                textAlign: TextAlign.center),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/cover/images/rectangle-18-bg.png'))),
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text(
                              'help',
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                  fontSize:  MediaQuery.of(context).size.height*0.038596,
                                  color: Color.fromARGB(255, 8, 8, 8)),
                            ),
            onTap: () => {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HelpScreen( )),
                      
                    )
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
           title: Text(
                              'About Us',
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                  fontSize:  MediaQuery.of(context).size.height*0.038596,
                                  color: Color.fromARGB(255, 8, 8, 8)),
                            ),
            onTap: () 
            => {
            
              Navigator.push(
                      context,
                      MaterialPageRoute(
                         
                          builder: (context) => AboutUs()),
                    )
              
              },
          ),
          
        ],
      ),
    );
  }
}