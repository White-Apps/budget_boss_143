import 'package:flutter/material.dart';

class OrdersScreenNkjdsdd extends StatefulWidget {
  @override
  _OrdersScreenNkjdsddState createState() => _OrdersScreenNkjdsddState();
}

class _OrdersScreenNkjdsddState extends State<OrdersScreenNkjdsdd> {
  List<String> orders = ['Order 1', 'Order 2', 'Order 3'];

  void fetchOrders() {
    print("Orders fetched");
  }

  void cancelOrder(int index) {
    setState(() {
      orders.removeAt(index);
    });
    print("Order canceled");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Orders')),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(orders[index]),
            trailing: IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () => cancelOrder(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchOrders,
        child: Icon(Icons.refresh),
      ),
    );
  }
}
