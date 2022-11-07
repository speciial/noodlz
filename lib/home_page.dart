import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> entries = <String>['A', 'B', 'C'];
  List<int> colorCodes = <int>[600, 500, 100];
  final TextEditingController textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: textCtrl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_forward),
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(color: Colors.amber),
                ),
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    entries.add(value);
                    textCtrl.clear();
                    setState(() {});
                  }
                },
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        color: Colors.amber,
                        child: Center(
                            child: Text(entries[entries.length - 1 - index])),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
