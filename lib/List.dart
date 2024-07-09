import 'package:flutter/material.dart';


class sample extends StatefulWidget {
  const sample({super.key});

  @override
  State<sample> createState() => _sampleState();
}

class _sampleState extends State<sample> {
  final TextEditingController _ctrl= TextEditingController();
  final List<int> _numbers = [];

  void _addNumber() {
    final String text = _ctrl.text;
    if (text.isNotEmpty) {
      final int? number = int.tryParse(_ctrl.text);
      if (number != null) {
        setState(() {
          _numbers.add(number);
        });
        _ctrl.clear();
      }
    }
  }
  void _delete_Item(int index) {
    setState(() {
      _numbers.removeAt(index);
    });
  }
  void _edit_Item(int index){
    final TextEditingController _edit_ctrl=TextEditingController();
    _edit_ctrl.text=_numbers[index].toString();

    showDialog(context: context,
        builder: (BuildContext context){
      return AlertDialog(
        title: Text("Change Number"),
        content: TextFormField(
          controller: _edit_ctrl,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Enter the Number"),
        ),
        actions: [
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("Cancel",style: TextStyle(fontSize: 15),)),
          TextButton(
            child: Text("change"),
            onPressed: (){
              final String New_Text=_edit_ctrl.text;
              if(New_Text .isNotEmpty){
                final int? New_Number=int .tryParse(New_Text);
                if(New_Number!= null){
                  setState(() {
                    _numbers[index]=New_Number;
                  });
                  Navigator.of(context).pop();
                }
              }
            },
          ),
        ],
      );
        }
    );
  }
  void _Ascending_order(){
    setState(() {
      _numbers.sort();
    });
  }

  void _Decending_order(){
    setState(() {

      List<int> sortedList = List.from(_numbers); //copy of original List
      sortedList.sort();//Ac
      sortedList= sortedList.reversed.toList();
      _numbers.clear();
      _numbers.addAll(sortedList);
    });
  }

  void _Maximum(){
    if(_numbers.isNotEmpty){
      final int max_Number= _numbers.reduce((a, b) => a>b? a:b);
      showDialog(context: context,
          builder: (BuildContext context)
          {
            return AlertDialog(
                title: Text("Maximum"),
                content:Text("The Maximum Number is $max_Number"),
                actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                  }, child: Text("Cancel",style: TextStyle(fontSize: 15),)),
                ],
            );
          }
      );
    }
  }
  void _Minimum(){
    if(_numbers.isNotEmpty){
      final int min_Number= _numbers.reduce((a, b) => a<b? a:b);
      showDialog(context: context,
          builder: (BuildContext context)
          {
            return AlertDialog(
              title: Text("Minimum"),
              content:Text("The Minimum Number is $min_Number"),
              actions: [
                TextButton(onPressed: (){
                  Navigator.of(context).pop();
                }, child: Text("Cancel",style: TextStyle(fontSize: 15),)),
              ],
            );
          }
      );
    }

  }
 

  // void _Edit_Number(int index) {
  //   setState(() {
  //     _numbers.At(index);
  //   });
  // }
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
          SizedBox(height: 10,),
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
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              _addNumber();
            },
                child: Text("ok",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _numbers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_numbers[index].toString(), style: TextStyle(fontSize: 24, color: Colors.white),),
                  trailing: Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(onPressed:(){
                          _delete_Item(index);
                        }, icon:Icon(Icons.delete)),
                        IconButton(onPressed:(){
                          _edit_Item(index);
                        }, icon:Icon(Icons.edit)),
                      ],


                    ),
                  ),

                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _Ascending_order,
                child: Text("Ascending"),
              ),
              SizedBox(width: 20,),
              ElevatedButton(onPressed: _Decending_order,
                  child:Text("Decending")),
            ],
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: _Maximum, child:Text("Maximum")),
              SizedBox(width: 20,),
              ElevatedButton(onPressed:_Minimum , child:Text("Minimum")),
            ],
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
