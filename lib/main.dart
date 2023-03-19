import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  Size calctextsize(String text, TextStyle style) // This function will calculate the expected width from the passing text
  {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
      textScaleFactor: WidgetsBinding.instance.window.textScaleFactor,
    )..layout();
    return textPainter.size;
  }

  List  getfinalsize(double textwidth) // This function will calculate and return height, width and maxline
  {

    double finalwidth = 72;
    double finalheight = 72;
    int finalmaxline = 1;


         if(textwidth > 72 && textwidth < 90) {
           finalwidth = 72;
           finalheight = 72;
           finalmaxline = 2;
           }


         if(textwidth == 90) {
           finalwidth = 90;
           finalheight = 72;
           finalmaxline = 2;
         }

         if(textwidth > 90) {
           finalwidth = 90;
           finalheight = 90;
           finalmaxline = 2;
         }

         if(textwidth > 90 && textwidth < 198) {
           finalwidth = 90;
           finalheight = 90;
           finalmaxline = 3;
         }

         if(textwidth > 198) {
           finalwidth = 198;
           finalheight = 90;
           finalmaxline = 3;
         }


    else
      {
        return [finalheight,finalwidth, finalmaxline];
      }

    return [finalheight,finalwidth, finalmaxline];
  }

  @override
  Widget build(BuildContext context) {
    const actualText = "Lorem ipsum dolor sit amet. id ignota omnium vel. Ne has idque movet, exhgcffxg ldsjhfoishdoifhosid";

    final double textWidth = calctextsize(actualText, TextStyle(fontSize: 13)).width; // this will call calctextsize function
    final ratioconfig = getfinalsize(textWidth); // this will call gatfinalsize function


    double height = ratioconfig[0]; // FIGURE OUT THIS VALUE
    double width = ratioconfig[1]; // FIGURE OUT THIS VALUE
    int maxLines = ratioconfig[2]; // FIGURE OUT THIS VALUE


    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(
            top: 90.0 - height,
            left: 4.0,
          ),
          padding: const EdgeInsets.all(8.0),
          constraints: BoxConstraints(maxWidth: width + 2), // For border
          height: height,
          decoration: BoxDecoration(
            color: Colors.greenAccent.shade700,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8.0),
              topRight: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 4.0),
                constraints: const BoxConstraints(maxWidth: 300),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Expanded(
                      child: Text(
                        "Auther",
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(fontSize: 9, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Text(actualText, maxLines: maxLines, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 13, color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}



