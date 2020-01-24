import 'package:flutter/material.dart';
import 'package:todo_app/models/todo_item.dart';
import 'package:todo_app/pages/item_add.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TodoItem> _lista = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          final retorno = await Navigator.push(
            context,
            MaterialPageRoute<String>(
              builder: (BuildContext context) {
                return ItemAdd();
              },
            ),
          );
          setState(
            () {
              if (retorno.isNotEmpty) {
                _lista.add(TodoItem(descricao: retorno));
              }
            },
          );
        },
      ),
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: _lista.length > 0
          ? ListView.builder(
              itemCount: _lista.length,
              itemBuilder: (BuildContext context, int index) {
                TodoItem _item = _lista[index]; 
                return Dismissible(
                  onDismissed: (direction) {
                    _lista.removeAt(index);
                  },
                  background: Container(color: Colors.red,),
                                  child: Card(
                    child: ListTile(
                      leading: Checkbox(
                        onChanged: (bool value) {
                          setState(() {
                            _item.done = !_item.done;
                          });
                        },
                        value: _item.done,
                      ),
                      title: Text(_item.descricao),
                    ),
                  ), key: Key(_item.descricao),
                );
              },
            )
          : Center(
              child: Text('Não há nenhum item'),
            ),
    );
  }
}
