import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(VibratingApp());

class VibratingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Vibration'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.notifications_active),
                onPressed: () {
                  Vibration.vibrate();
                })
          ],
        ),
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Vibration.vibrate();
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Vibrate for default 500ms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      Vibration.vibrate(duration: 1000);
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Vibrate for 1000ms',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Text(
                          'প্যাটার্ন: অপেক্ষা। 0.৫ সেঃ, ভায়ব্রেট ১ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ২ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ৩ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ০.৫ সেঃ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.amber,
                      );
                      Scaffold.of(context).showSnackBar(snackBar);
                      Vibration.vibrate(
                        pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Vibrate with pattern',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () {
                      final snackBar = SnackBar(
                        content: Text(
                          'প্যাটার্ন: অপেক্ষা। 0.৫ সেঃ, ভায়ব্রেট ১ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ২ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ৩ সেঃ, অপেক্ষা 0.৫ সেঃ, ভায়ব্রেট ০.৫ সেঃ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.red,
                      );

                      Scaffold.of(context).showSnackBar(snackBar);
                      Vibration.vibrate(
                        pattern: [500, 1000, 500, 2000, 500, 3000, 500, 500],
                        intensities: [128, 255, 64, 255],
                      );
                    },
                    child: Container(
                      width: 300,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                          child: Text(
                        'Vibrate with pattern and amplitude',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      )),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
