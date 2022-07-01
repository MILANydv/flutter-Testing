import 'package:flutter/Material.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    ),
  );
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNumber = TextEditingController();
  final TextEditingController _secondNumber = TextEditingController();

  num result = 0;

  add() {
    setState(() {
      result =
          double.parse(_firstNumber.text) + double.parse(_secondNumber.text);
    });
  }

  subtract() {
    setState(() {
      result =
          double.parse(_firstNumber.text) - double.parse(_secondNumber.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                  controller: _firstNumber,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: 'First Number',
                      hintText: 'Enter First number',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ))),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _secondNumber,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText: 'Second Number',
                    hintText: 'Enter Second number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    add();
                  },
                  child: const Text('Add'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    subtract();
                  },
                  child: const Text('Subtract'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Card(
                color: Colors.amberAccent,
                child: ListTile(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  title: Text('Result:$result ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
