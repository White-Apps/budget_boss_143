import 'package:flutter/material.dart';

class HomeUHJKjbhB extends StatefulWidget {
  @override
  _HomeUHJKjbhBState createState() => _HomeUHJKjbhBState();
}

class _HomeUHJKjbhBState extends State<HomeUHJKjbhB> {
  bool isDataLoaded = false;

  void fetchDashboardData() {
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
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: isDataLoaded
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Dashboard Data Loaded!'),
                  ElevatedButton(
                    onPressed: fetchDashboardData,
                    child: Text('Refresh Data'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: fetchDashboardData,
                child: Text('Load Data'),
              ),
      ),
    );
  }
}
