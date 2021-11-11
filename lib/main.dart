import 'package:flutter/material.dart';

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
                gameLogic();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          gameLogic();
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
    print('${controller.text}');
  }
}
