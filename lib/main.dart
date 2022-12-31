import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int Firstnum = 0;
  int Secondnum = 0;
  String texttodisplay = "";
  String result = "";
  String operatortoPerform = "";

  void buttonclicked(String btnvlu)
  {
    if(btnvlu == "AC")
      {
        texttodisplay = "";
        Firstnum = 0;
        Secondnum = 0;
        result = "";
      }
    else if(btnvlu == "+" || btnvlu == "-" || btnvlu == "*" || btnvlu == "/")
      {
        Firstnum = int.parse(texttodisplay);
        result = "";
        operatortoPerform = btnvlu;
      }
    else if(btnvlu == "=")
      {
        Secondnum = int.parse(texttodisplay);
        if(btnvlu == "+")
          {
            result = (Firstnum + Secondnum).toString();
          }
        if(btnvlu == "-")
        {
          result = (Firstnum - Secondnum).toString();
        }
        if(btnvlu == "*")
        {
          result = (Firstnum * Secondnum).toString();
        }
        if(btnvlu == "/")
        {
          result = (Firstnum / Secondnum).toString();
        }
      }
    else
      {
        result = int.parse(texttodisplay + btnvlu).toString();
      }
    setState(() {
      texttodisplay = result;
    });

  }

  Widget custombutton(String btnvlu)
  {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            print("$btnvlu");
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Container(
            height: 60,width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black12,
            ),
            child: Center(child: Text("$btnvlu",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text("$texttodisplay",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 60,width: 200,
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Center(child: Text("AC",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 30),)),
                  ),
                ),
                SizedBox(width: 30,),
                custombutton("%"),
                SizedBox(width: 10,),
                custombutton("/"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                custombutton("7"),
                SizedBox(width: 10,),
                custombutton("8"),
                SizedBox(width: 10,),
                custombutton("9"),
                SizedBox(width: 10,),
                custombutton("*"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                custombutton("4"),
                SizedBox(width: 10,),
                custombutton("5"),
                SizedBox(width: 10,),
                custombutton("6"),
                SizedBox(width: 10,),
                custombutton("-"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                custombutton("1"),
                SizedBox(width: 10,),
                custombutton("2"),
                SizedBox(width: 10,),
                custombutton("3"),
                SizedBox(width: 10,),
                custombutton("+"),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                custombutton("00"),
                SizedBox(width: 10,),
                custombutton("0"),
                SizedBox(width: 10,),
                custombutton("."),
                SizedBox(width: 10,),
                Container(
                  height: 65,width: 120,
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(child: Text("=",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
