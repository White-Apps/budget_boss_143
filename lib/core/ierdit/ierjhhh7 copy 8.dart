import 'package:flutter/material.dart';

class Statistivsbdjnklssdnlksdlkd extends StatefulWidget {
  @override
  _StatistivsbdjnklssdnlksdlkdState createState() => _StatistivsbdjnklssdnlksdlkdState();
}

class _StatistivsbdjnklssdnlksdlkdState extends State<Statistivsbdjnklssdnlksdlkd> {
  bool isDataLoaded = false;

  void fetchStats() {
    setState(() {
      isDataLoaded = false;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isDataLoaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Center(
        child: isDataLoaded
            ? Text('Statistics data displayed here.')
            : ElevatedButton(
                onPressed: fetchStats,
                child: Text('Load Statistics'),
              ),
      ),
    );
  }
}
