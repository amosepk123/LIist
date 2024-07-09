import 'dart:html';

import 'package:flutter/material.dart';

class original extends StatefulWidget {
  const original({super.key});

  @override
  State<original> createState() => _originalState();
}

class _originalState extends State<original> {
  final TextEditingController _ctrlName = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPhone = TextEditingController();
  final List<Entry> _entries=[];

  void _addEntry(){
    final String name = _ctrlName.text;
    final String email = _ctrlEmail.text;
    final String phone = _ctrlPhone.text;
    if(_ctrlName.text .isNotEmpty && _ctrlEmail.text . isNotEmpty && _ctrlPhone.text.isNotEmpty){
      setState(() {
        _entries.add(Entry(name: name, email: email, phone: phone));
      });
      _ctrlName.clear();
      _ctrlEmail.clear();
      _ctrlPhone.clear();
    }
  }

  void _deleteEntry(int index) {
    setState(() {
      _entries.removeAt(index);
    });
  }
  void _editEntry(int index, Entry newEntry) {
    setState(() {
      _entries[index] = newEntry;
    });
  }

  void _showEditDialog(int index){
    _ctrlName.text = _entries[index].name;
    _ctrlEmail.text = _entries[index].email;
    _ctrlPhone.text = _entries[index].phone;

    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Edit Entry"),
            content: Column(
              //mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _ctrlName,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    hintText: "Name",
                    filled: true,
                    fillColor: Colors.blueGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ctrlEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    hintText: "Email",
                    filled: true,
                    fillColor: Colors.blueGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ctrlPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    icon: Icon(Icons.phone),
                    hintText: "Phone",
                    filled: true,
                    fillColor: Colors.blueGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(onPressed:(){
            Navigator.of(context).pop();
          },
          child:  Text("OK", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black,),),)
            ],
          );
        }

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
        title: Text("List", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,),),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _ctrlName,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: "Name",
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _ctrlEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                hintText: "Enter Your Email",
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              controller: _ctrlPhone,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Phone Number",
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
              onPressed: _addEntry,
              child: Text("OK", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black,),),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _entries.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    "${_entries[index].name} . ${_entries[index].email} . ${_entries[index].phone}",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _showEditDialog(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteEntry(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
class Entry{
  String name;
  String email;
  String phone;

  Entry({required this.name, required this.email, required this.phone});
}
