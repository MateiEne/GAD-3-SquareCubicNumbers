import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const SquareCubicNumbers());
}

class SquareCubicNumbers extends StatelessWidget {
  const SquareCubicNumbers({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController controller = TextEditingController();

  String? errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number shapes'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Text(
                'Please enter a number to see if it is square or cubic',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
            ),
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'enter a number',
                errorText: errorText,
              ),
              onSubmitted: (String? value) {
                setState(() {
                  checkNumber();
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            checkNumber();
          });
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  void checkNumber() {
    if (controller.text.isEmpty) {
      errorText = 'Please enter a number';
      return;
    }

    int? valueReceived;
    valueReceived = int.tryParse(controller.text);

    if (valueReceived == null) {
      errorText = 'this is not a valid number';
      return;
    }

    String dialogText;

    if (isSquareNumber(valueReceived)) {
      if (isCubicNumber(valueReceived)) {
        dialogText = 'Number $valueReceived is both SQUARE and CUBIC';
      } else {
        dialogText = 'Number $valueReceived is SQUARE';
      }
    } else if (isCubicNumber(valueReceived)) {
      dialogText = 'Number $valueReceived is CUBIC';
    } else {
      dialogText = 'Number $valueReceived is neither SQUARE or CUBIC';
    }

    errorText = null;
    showPopUp(valueReceived, dialogText);
    controller.clear();
  }

  void showPopUp(int? value, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$value'),
          content: Text(
            text,
          ),
        );
      },
    );
  }

  bool isCubicNumber(int value) {
    if (value == 1 || value == 0) {
      return true;
    }

    int tripleI;

    for (int i = 2; (tripleI = i * i * i) <= value; i++) {
      if (tripleI == value) {
        return true;
      }
    }

    return false;
  }

  bool isSquareNumber(int value) {
    if (value == 1 || value == 0) {
      return true;
    }

    int doubleI;
    for (int i = 2; (doubleI = i * i) <= value; i++) {
      if (doubleI == value) {
        return true;
      }
    }

    return false;
  }
}
