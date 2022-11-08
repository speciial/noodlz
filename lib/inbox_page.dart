import 'package:flutter/material.dart';

// TODO: swipe left to remove items from the list

class InboxPage extends StatefulWidget {
  const InboxPage({super.key});

  @override
  State<InboxPage> createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  List<String> entries = <String>[];
  final TextEditingController textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // TODO: autofocus on that text field
              // TODO: close keyboard when focus is lost
              TextFormField(
                controller: textCtrl,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_forward),
                  hintText: 'What\'s on your mind?',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                onFieldSubmitted: (value) {
                  if (value.isNotEmpty) {
                    entries.add(value);
                    textCtrl.clear();
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 8.0),
              Expanded(
                child: ListView.builder(
                    itemCount: entries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text(entries[entries.length - 1 - index]),
                        ),
                      );
                    }),
              )
            ],
          )),
    );
  }
}
