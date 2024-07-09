import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final int number;
    final int index;
  final VoidCallback onDelete;
  final Function(int, int) onEdit;

  DetailsScreen({
    required this.number,
    required this.index,
    required this.onDelete,
    required this.onEdit,
  });

  final TextEditingController _editCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _editCtrl.text = number.toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: _editCtrl,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Edit Number",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    final String newText = _editCtrl.text;
                    if (newText.isNotEmpty) {
                      final int? newNumber = int.tryParse(newText);
                      if (newNumber != null) {
                        onEdit(index, newNumber);
                        Navigator.of(context).pop();
                      }
                    }
                  },
                  child: Text("change"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    onDelete();
                    Navigator.of(context).pop();
                  },
                  child: Text("Delete"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
