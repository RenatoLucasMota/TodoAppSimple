import 'package:flutter/material.dart';

class ItemAdd extends StatelessWidget {
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.done),
        onPressed: () {
          Navigator.pop(context, _controller.text);
        },
      ),
      appBar: AppBar(
        title: Text('Adicionar Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: TextField(controller: _controller,),
        ),
      ),
    );
  }
}
