import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/Quote.dart';
import 'package:flutterapp/pages/ChooseLocation.dart';
import 'package:flutterapp/pages/HomeWorldTime.dart';
import 'package:flutterapp/pages/Loading.dart';
import 'QuoteCard.dart';

void main() {
  runApp(MaterialApp(
//    home: Home()
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => HomeWorldTime(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int level = 0;
  List<Quote> quotes = [
    Quote(text: "Speak truth", author: "Zohaib"),
    Quote(text: "Truth", author: "Siddique")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red[900],
      appBar: AppBar(
        title: Text('Welcome!'),
        backgroundColor: Colors.red,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/zohaib.jpg'),
                  radius: 40,
                ),
              ),
              Divider(
                height: 20,
                color: Colors.grey,
              ),
              RaisedButton(
                child: Text('World time app'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeWorldTime()),
                  );
                },
              ),
              SizedBox(height: 10),
              Text(
                'NAME',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Zohaib Siddique',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 30),
              Text(
                'S/O',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Muhammad Siddique',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 30),
              Text(
                'LEVEL',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 10),
              Text(
                '$level',
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'zohaibsvu@gamil.com',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.0
                    ),
                  )
                ],
              ),
              SizedBox(height: 30),
              Text(
                'Quotes',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 18
                ),
              ),
              SizedBox(height: 10),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: quotes.map((quote) => QuoteCard(
                      quote: quote,
                      delete: () {
                        setState(() {
                          quotes.remove(quote);
                        });
                      },
                  )
                  ).toList()
              )
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.red,
        onPressed: (){
          setState(() {
            level+=1;
          });
        },
      ),
    );
  }
}


