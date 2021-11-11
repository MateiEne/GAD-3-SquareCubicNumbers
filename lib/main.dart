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
  String dialogText = '';

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
                  gameLogic();
                });
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            gameLogic();
          });
        },
        child: const Icon(Icons.check),
      ),
    );
  }

  void gameLogic() {
    checkNumber();
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

    if (isSquareNumber(valueReceived)) {
      if (isCubicNumber(valueReceived)) {
        dialogText = 'is both SQUARE and CUBIC';
      } else {
        dialogText = 'is SQUARE';
      }
    } else if (isCubicNumber(valueReceived)) {
      dialogText = 'is CUBIC';
    } else {
      dialogText = 'is neither SQUARE or CUBIC';
    }

    errorText = null;
    showPopUp(valueReceived);
  }

  void showPopUp(int? value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('$value'),
          content: Text(
            'Number $value $dialogText',
          ),
        );
      },
    );
  }

  bool isCubicNumber(int value) {
    if (value == 1 || value == 0) {
      return true;
    }

    for (int i = 2; i < value / 2; i++) {
      if (i * i * i == value) {
        return true;
      }
    }

    return false;
  }

  bool isSquareNumber(int value) {
    if (value == 1 || value == 0) {
      return true;
    }

    for (int i = 2; i < value / 2; i++) {
      if (i * i == value) {
        return true;
      }
    }

    return false;
  }
}
