import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    ),
  );
}

// UI Design

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

int value = 0;
String check = 'times';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;

    repeat(){
      setState(() {
        endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Good  Li\'l Steps'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/location_background.jfif'),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    color: Colors.black,
                    child: Text(
                      'I\'ve helped the world $value $check today',
                      style:
                          TextStyle(fontSize: 20, fontFamily: 'SourceSansPro'),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: CountdownTimer(
                  endTime: endTime,
                  onEnd: repeat(),
                  textStyle: TextStyle(
                      color: Colors.red[900],
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            value++;
            if (value == 1) {
              check = 'time';
            } else {
              check = 'times';
            }
          });
          print(value);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
