import 'package:flutter/material.dart';

class MessagesScreenQcjksmcsav extends StatefulWidget {
  @override
  _MessagesScreenQcjksmcsavState createState() => _MessagesScreenQcjksmcsavState();
}

class _MessagesScreenQcjksmcsavState extends State<MessagesScreenQcjksmcsav> {
  List<String> messages = ["Hello", "Hi", "Welcome"];
  bool isLoading = false;

  void fetchMessages() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
        messages.add("New message!");
      });
    });
  }

  void deleteMessage(int index) {
    setState(() {
      messages.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            isLoading ? CircularProgressIndicator() : ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => deleteMessage(index),
                  ),
                );
              },
            ),
            ElevatedButton(
              onPressed: fetchMessages,
              child: Text('Fetch Messages'),
            ),
          ],
        ),
      ),
    );
  }
}
