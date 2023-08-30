import 'package:bmi_app/score_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key?key}) : super(key:key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtcontroller = TextEditingController();
  var ftcontroller=TextEditingController();
  var incontroller=TextEditingController();
  var bgcolor=Colors.blue;
  var res=" ";
  var result="";

  bool isloding=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Center(child: Text("BMI CALCULATOR")),
      ),
      body: Container(
        color: Colors.amber[50],
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontSize: 34,fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your weight(in kgs)'),
                    prefixIcon: FaIcon(FontAwesomeIcons.weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 21,),
                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in ft)'),
                    prefixIcon: FaIcon(FontAwesomeIcons.f),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: incontroller,
                  decoration: InputDecoration(
                    label: Text('Enter your Height(in inch)'),
                    prefixIcon: FaIcon(FontAwesomeIcons.salesforce),
                  ),
                  keyboardType: TextInputType.number,
                ),
                ElevatedButton(
                  onPressed: (){
                    var wt=wtcontroller.text.toString();
                    var ft=ftcontroller.text.toString();
                    var inch=incontroller.text.toString();
                    double? bmi;
                    if(wt!=" "  && ft!="" && inch!="") {
                      var iWt=int.parse(wt);
                      var iFt=int.parse(ft);
                      var iIntch=int.parse(inch);

                      var tIntch=(iFt*12) + iIntch;
                      var tCm=tIntch*2.52;    //in to cm

                      var tM=tCm/100;   //total height in M

                      bmi=iWt/(tM*tM);
                      var msg="";

                      if(bmi>25){

                        bgcolor=Colors.orange;
                      } else if(bmi<18) {

                        bgcolor=Colors.orange;
                      } else {

                        bgcolor=Colors.orange;
                      }



                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScoreScreen(
                            bmiScore: bmi!,
                            age: 20,
                          ),
                        ),
                      );
                    }
                    else {
                      setState(() {
                        result = "Please fill all the required blanks";
                      });
                    }
                  },
                  child: Text('Calculate'),
                ),
                SizedBox(height: 11,),

                Text(
                  result,
                  style: TextStyle(fontSize:19),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
