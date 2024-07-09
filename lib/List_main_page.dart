import 'package:flutter/material.dart';

import 'Second_Screen.dart';

class sample21 extends StatefulWidget {
  const sample21({super.key});

  @override
  State<sample21> createState() => _sample21State();
}

class _sample21State extends State<sample21> {
  final TextEditingController _ctrl = TextEditingController();
  final List<int> _numbers = [];

  void _addNumber() {
    final String text = _ctrl.text;
    if (text.isNotEmpty) {
      final int? number = int.tryParse(text);
      if (number != null) {
        setState(() {
          _numbers.add(number);
        });
        _ctrl.clear();
      }
    }
  }

  void _deleteItem(int index) {
    setState(() {
      _numbers.removeAt(index);
    });
  }

  void _editItem(int index, int newNumber) {
    setState(() {
      _numbers[index] = newNumber;
    });
  }

  void _ascendingOrder() {
    setState(() {
      _numbers.sort();
    });
  }

  void _descendingOrder() {
    setState(() {
      _numbers.sort((a, b) => b.compareTo(a));
    });
  }

  void _maximum() {
    if (_numbers.isNotEmpty) {
      final int maxNumber = _numbers.reduce((a, b) => a > b ? a : b);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Maximum Number"),
            content: Text("The maximum number is $maxNumber"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK", style: TextStyle(fontSize: 15)),
              ),
            ],
          );
        },
      );
    }
  }

  void _minimum() {
    if (_numbers.isNotEmpty) {
      final int minNumber = _numbers.reduce((a, b) => a < b ? a : b);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Minimum Number"),
            content: Text("The minimum number is $minNumber"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK", style: TextStyle(fontSize: 15)),
              ),
            ],
          );
        },
      );
    }
  }

  void _navigateToDetailsScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(
          number: _numbers[index],
          index: index,
          onDelete: () => _deleteItem(index),
          onEdit: _editItem,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.menu_outlined, size: 40),
        ),
        title: Text(
          "List",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Container(
            height: 50,
            width: 400,
            child: TextFormField(
              controller: _ctrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _addNumber,
              child: Text(
                "OK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(

              itemCount: _numbers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    _numbers[index].toString(),
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                  
                  onTap: () => _navigateToDetailsScreen(index),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _ascendingOrder,
                child: Text("Ascending"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _descendingOrder,
                child: Text("Descending"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _maximum,
                child: Text("Maximum"),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                onPressed: _minimum,
                child: Text("Minimum"),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
