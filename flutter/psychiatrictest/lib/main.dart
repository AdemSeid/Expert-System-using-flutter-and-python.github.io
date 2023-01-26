import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:exf/nav_drawer.dart';
import 'package:exf/test.dart';
import 'package:upgrader/upgrader.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Upgrader.clearSavedSettings();

  runApp(const MyApp());


}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        color: Color.fromARGB(255, 59, 242, 255),
       
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Color.fromRGBO(132, 218, 209, 1),

          splash: Container(
              child: Column(
            children: [
              Container(
                child: Text(
                  'WELCOME',
                  style: GoogleFonts.lato(
                    fontStyle:FontStyle.italic,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 153, 5, 12)),
                ),
              ),
            ],
          )),

        
          nextScreen: Splash2(),
          splashTransition: SplashTransition.rotationTransition,
          duration: 300,
        ));
  }
}


class Splash2 extends StatefulWidget {
  const Splash2({Key? key}) : super(key: key);

  @override
  State<Splash2> createState() => _splashtwo();
}

class _splashtwo extends State<Splash2> {
  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown
      ]
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        color: Color.fromARGB(255, 59, 242, 255),
        title: 'Psychiatric Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: AnimatedSplashScreen(
          backgroundColor: Color.fromRGBO(132, 218, 209, 1),
          splash: Container(
              child: Column(
            children: [
              Container(
                child: Text(
                  'WELCOME',
                  style: GoogleFonts.lato(
                    fontStyle: FontStyle.italic,
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color:  Color.fromARGB(255, 153, 5, 12)),
                ),
              ),
            ],
          )),

        
          nextScreen: Endsplash(),
          splashTransition: SplashTransition.fadeTransition,
          duration: 100,
        ));
  }
}



class Endsplash extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<Endsplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHomePage())));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
     backgroundColor: Color.fromRGBO(132, 218, 209, 1),
      //child:FlutterLogo(size:MediaQuery.of(context).size.height)
     body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
             height: MediaQuery.of(context).size.height*0.2631578,
            width: MediaQuery.of(context).size.width*0.46875,
            child: CircleAvatar(
              backgroundImage:
                  AssetImage('assets/cover/images/ellipse-4-bg-dwx.png'),
            ),
          ),

           SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

          Container(
             child: Text(
                  'PSYCHIATRIC TEST',
                  style: GoogleFonts.lato(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: MediaQuery.of(context).size.height * 0.0561,
                      color: Color.fromARGB(255, 153, 5, 12)),
                  textAlign: TextAlign.center,
                ),
                
          ),
           SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),

        
        ],
      ),
     ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: NavDrawer(),
      appBar: AppBar(
        title: Text(
                              'Menu',
                              style: GoogleFonts.lato(
                                fontStyle: FontStyle.italic,
                                  fontSize:  MediaQuery.of(context).size.height*0.038596,
                                  color: Color.fromARGB(255, 252, 252, 252)),
                            )
      ),
  
      body: UpgradeAlert(
        child: Container(
           
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/cover/images/image-1-bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
        mainAxisAlignment: MainAxisAlignment.end,

            children: [
               Container(
                            width: MediaQuery.of(context).size.width*0.6,
                height: MediaQuery.of(context).size.height*0.14035,
                 padding: EdgeInsetsDirectional.all(10),

                            child: ElevatedButton(
                               style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 17, 2, 146),
                        shape: StadiumBorder()),
                    onPressed: () {
                            Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>TestScrn()),
                         // builder: (context) => Scene()),
                    );
                    },

                                child: Text('Start Test', style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.06),)),
                            ),
              SizedBox(height: MediaQuery.of(context).size.height *0.05263,)
            ]),
           


        )
      ),
    );
  }
}
