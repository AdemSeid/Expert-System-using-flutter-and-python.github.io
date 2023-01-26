import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:exf/result_src.dart';
import 'dart:io';
import 'package:google_fonts/google_fonts.dart';

class TestScrn extends StatefulWidget {


  State<StatefulWidget> createState() {
    return _testxcreen();
  }
}

class _testxcreen extends State<TestScrn> {
  int _counter = 0;
  final _formKey = GlobalKey<FormState>();
  List<String> questins = [
   
 'Are you experiencing any nervousness?',  
    'Do you experience any panic?', 
    'Are you breathing rapidly?',
    'Have you been sweating more than usual?',
    'Have you been having trouble concentrating on things?',
    'Are you having difficulty falling asleep or staying asleep?',
    'Are you experiencing any difficulties at work or in other areas of your life?',
    'Do you find yourself feeling hopeless?',
    'Have you been feeling particularly angry?',
    'Are you finding yourself overreacting?',
    'Are there any change in eating habit lately?',
    'Have you been having thoughts of suicide or self-harm?',
    'Have you been feeling tired?',
    'Do you have a close friend?',
    'Are there any habit of social media addiction with you?',
    'Have you noticed any changes in your weight recently?',
    'Are material possessions playing a big role in your thoughts or worries lately?',
    'Do you consider yourself an introverted or extroverted person?',
    'Do you experiance popping up stressful memory?',
    'Are you experiencing nightmares or disturbing dreams?',
    'Are there any people or activities that you are currently avoiding?',
    'Are you feeling generally negative or pessimistic about things?',
    'Are you having trouble focusing or paying attention?',
    'Do you ever tend to blame yourself?',
    'CLICK RESULT',

  ];

  List<String> det_suges = [
    'You are Normal',
    'Anxiety is the mind and body reaction to stressful, dangerous, or unfamiliar situations. The two main treatments for anxiety disorders are psychotherapy and medications. You may benefit most from a combination of the two. It may take some trial and error to discover which treatments work best for you. For more information visit your doctors',
    ' Loneliness is an unpleasant emotional response to perceived isolation. Loneliness is also described as social pain —a psychological mechanism which motivates individuals to seek social connections. Exercise is known to have a positive impact on mental health. While exercise may not relieve loneliness on its own, it can help improve your mood overall and increase your feelings of wellness, which may offer some protection against loneliness. Enjoy the outdoors. Sunlight can help increase serotonin in your body, which can help improve your mood. For more information visit your doctors',
    'Stress can be defined as any type of change that causes physical, emotional or psychological strain. Stress is your body\'s response to anything that requires attention or action. Everyone experiences stress to some degree. The way you respond to stress, however, makes a big difference to your overall well-being. To solve stress problems: Sleep Adequately, Connect with others, eat healthy, exersice regularly and minimize news feeds. For more information visit your doctors',
    'Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Depression is unlikely to simply go away on its own. In fact, if ignored and left untreated, depression can go on for months, sometimes years, and can have many negative effects on a person life. Every person needs to find the treatment that\'s right for them. It can take time and patience to find a treatment that works. Different types of depression require different treatment. Mild symptoms may be relieved by: learning about the condition, lifestyle changes (such as regular physical exercise) and psychological therapy provided by a mental health professional or via online e-therapies.For moderate to more severe depression, medical treatments are likely to be required, in combination with these other treatments.For more information visit your doctors'
  ];
  List<int> answers = [
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0
  ];
  int i = 0;
  int j = 0;
  int count = 0;
  String disor = '';
  String disor_detail = 'detail';
  bool isLoading = false;
  bool internet_con = true;
  bool? _isConnected;


  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(132, 218, 209, 1),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              /////text for question
              Container(
                width: MediaQuery.of(context).size.width * 0.9375,
                height: MediaQuery.of(context).size.height * 0.315789,
                padding: EdgeInsets.all(12),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 212, 212, 212),
                  border: Border.all(
                    color: Color.fromARGB(255, 160, 160, 160),
                    width: MediaQuery.of(context).size.width * 0.040625,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                ),
                child: Text(
                  questins[i],
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.lato(
                      
                     fontSize:MediaQuery.of(context).size.height*0.036,
                      color: Color.fromARGB(255, 0, 0, 0)),
                  
                ),
              ),
              //yes button and no button container
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.84375,
                height: MediaQuery.of(context).size.height * 0.3,
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
                child: Column(
                  children: [
                    // yes button
                    Container(
                      decoration: BoxDecoration(
                        //color: Color.fromARGB(255, 212, 212, 212),

                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                      ),
                      padding: EdgeInsetsDirectional.all(10),
                      width: MediaQuery.of(context).size.width * 0.625,
                      height: MediaQuery.of(context).size.height * 0.1228,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 56, 34, 2),
                              shape: StadiumBorder()),
                          onPressed: () {
                            
                            if (i == 24) {
                              setState(
                                () {
                                  Text('////////////////////');
                                },
                              );
                            } else if (i < 23) {
                              setState(
                                () {
                                  answers[i] = 1;
                                  count++;
                                  i++;
                                  Text(questins[i]);
                                },
                              );
                            } else if (i == 23) {
                              answers[i] = 1;
                              i++;
                              Text(questins[i]);
                            }
                           
                          },
                          child: Text(
                            'YES',
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.03,
                            ),
                          )),
                    ),
                    //NO BUTTON
                    Container(
                      padding: EdgeInsetsDirectional.all(10),
                      width: MediaQuery.of(context).size.width * 0.625,
                      height: MediaQuery.of(context).size.height * 0.1228,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 56, 34, 2),
                              shape: StadiumBorder()),
                          onPressed: () {
                            if (i == 24) {
                              setState(
                                () {
                                  Text('//////////////////////');
                                },
                              );
                            } else if (i < 23) {
                              setState(
                                () {
                                  answers[i] = 0;
                                  count ++;
                                  i++;
                                  Text(questins[i]);
                                },
                              );
                            } else if (i == 23) {
                              answers[i] = 0;
                              i++;
                              Text(questins[i]);
                            }
                          },
                          child: Text('NO',
                              style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                              ))),
                    ),
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01754),

              ///

              Container(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1754,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 5, 63, 58),
                      fixedSize: const Size(150, 150),
                      shape: const CircleBorder(),
                      side: BorderSide(
                        color: Color.fromARGB(255, 247, 247, 247),
                      ),
                    ),
                    onPressed: () async {
                      try {
                       

                        
                        setState(() {
                          
                          isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 8), () {
                          setState(() {
                            isLoading = false;
                          });
                        });

                        final url =
                            'https://prgrammeradem.pythonanywhere.com/name';
                        final response = await http.post(Uri.parse(url),
                            body: json.encode({'name': answers}));
                        var resp = await http.get(Uri.parse(
                            'https://prgrammeradem.pythonanywhere.com/name')); //getting the response from our backend server script

                        final decoded = json.decode(resp.body) as Map<String,
                            dynamic>; //converting it from json to key value pair
                        disor = decoded['name'];
                        setState(() {
                          if (disor == 'Normal') {
                            disor_detail = det_suges[0];
                          } else if (disor == 'Anxiety') {
                            disor_detail = det_suges[1];
                          } else if (disor == 'Loneliness') {
                            disor_detail = det_suges[2];
                          } else if (disor == 'Stress') {
                            disor_detail = det_suges[3];
                          } else if (disor == 'Depression') {
                            disor_detail = det_suges[4];
                          }
                        });

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultScreen(disor, disor_detail, i, count)),
                          // builder: (context) => Scene()),
                        );


                        
                      }
                       on SocketException catch (_) {
                        setState(() {
                         
                          isLoading = false;
                         
                            var snackbar = SnackBar(content: Text(
                            'check your internet connection!!!',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.033),
                                    
                          ),);
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);


                        });
                      }
                    },
                    child: isLoading
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: const [
                              CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            ],
                          )
                        : Text(
                            'Result',
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.04),
                          ),
                  ))
            ],
          ),
        ));
  }
}

