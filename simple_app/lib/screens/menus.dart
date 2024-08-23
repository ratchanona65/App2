import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Menus extends StatefulWidget {

  const Menus({super.key});

  @override
  State<Menus> createState() => _MenusState();
}

class _MenusState extends State<Menus> {
  List<dynamic> items = ['item1', 'item2', 'item3', 'item4'];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index){
        return ListTile(
          title: Text('${items[index]}'),
          onLongPress: (){
            setState(() { //เรียก items.removeAt(index);
              items.removeAt(index);
            });
          },
        );
      }
    );
  }
}