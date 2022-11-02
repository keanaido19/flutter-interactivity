import 'package:flutter/material.dart';

class FunkyHomeView extends StatefulWidget {
  const FunkyHomeView({super.key, required this.title});

  final String title;

  @override
  State<FunkyHomeView> createState() => _FunkyHomeViewState();
}

class _FunkyHomeViewState extends State<FunkyHomeView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isChecked = false;
  bool _isSwitched = false;
  final List<String> _list = ["Pan", "da", "bear"];
  late String _dropdownValue = _list.first;
  String _colour = "Blue";
  double _currentSliderValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: <Widget>[
              TextField(
                obscureText: true,
                onSubmitted: (String text) async {
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Wow"),
                          content: Text("Your password is \"$text\"!"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Sad"),
                            )
                          ],
                        );
                      }
                  );
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 30,),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter your email",
                      ),
                      validator: (String? text) {
                        if (text == null || text.isEmpty) {
                          return "Give me your email!";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context)
                              ..removeCurrentSnackBar()
                              ..showSnackBar(
                                  const SnackBar(
                                      content: Text("Thanks for your email!"),
                                  )
                              );
                          }
                        },
                        child: const Text("Sell your data"),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
              ),
              const SizedBox(height: 30,),
              DropdownButton<String>(
                  value: _dropdownValue,
                  icon: const Icon(Icons.adb_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.red),
                  underline: Container(
                    height: 2,
                    color: Colors.red,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _dropdownValue = value!;
                    });
                  },
                  items: _list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList()
              ),
              const SizedBox(height: 30,),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF1976D2),
                              Color(0xFF42A5F5),
                            ],
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.all(16.0),
                        textStyle: const TextStyle(fontSize: 20),
                      ),
                      onPressed: () async {
                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Blue"),
                              content: const Text("Blue!"),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text("Blue"),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Blue'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              FloatingActionButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(
                        const SnackBar(
                            content: Text("I don't know the time")
                        )
                    );
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.access_time_rounded),
              ),
              Column(
                children: <Widget>[
                  ListTile(
                    title: const Text('Blue'),
                    leading: Radio<String>(
                      activeColor: Colors.blue,
                      value: "Blue",
                      groupValue: _colour,
                      onChanged: (String? value) {
                        setState(() {
                          _colour = value!;
                        });
                      },
                    ),
                  ),
                  ListTile(
                    title: const Text('Red'),
                    leading: Radio<String>(
                      value: "Red",
                      groupValue: _colour,
                      onChanged: (String? value) {
                        setState(() {
                          _colour = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {},
                child: const Text('Enabled'),
              ),
              const SizedBox(height: 30),
              Slider(
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              Switch(
                value: _isSwitched,
                onChanged: (bool value) {
                  // This is called when the user toggles the switch.
                  setState(() {
                    _isSwitched = value;
                  });
                },
              ),
              const Text(
                'Get rid of boring text.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
