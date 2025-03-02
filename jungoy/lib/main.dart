import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

void main() {
  runApp(MyApp());
}
//fghj
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        fontFamily: 'Lobster',
      ),
      home: TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<String> _todos = [];
  final _textController = TextEditingController();
  Color backgroundColor = Colors.white;

  void _addTodo() {
    if (_textController.text.isNotEmpty) {
      setState(() {
        _todos.add(_textController.text);
        _textController.clear();
      });
    }
  }

  void _removeTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  void _changeBackground() {
    setState(() {
      backgroundColor = backgroundColor == Colors.white ? Colors.grey.shade900 : Colors.white;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Lobster')),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pinkAccent, Colors.pink.shade900],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(FeatherIcons.sun),
            onPressed: _changeBackground,
          )
        ],
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        color: backgroundColor,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  hintText: 'Enter a task...',
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: _addTodo,
              icon: Icon(FeatherIcons.plusCircle),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              label: Padding(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                child: Text(
                  'Add Task',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _todos.length,
                itemBuilder: (context, index) {
                  return MouseRegion(
                    onEnter: (_) => setState(() {}),
                    onExit: (_) => setState(() {}),
                    child: Card(
                      elevation: 6,
                      margin: EdgeInsets.symmetric(vertical: 6),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      shadowColor: Colors.pinkAccent,
                      child: ListTile(
                        tileColor: Colors.white,
                        title: Text(
                          _todos[index],
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        trailing: IconButton(
                          icon: Icon(FeatherIcons.trash, color: Colors.redAccent),
                          onPressed: () => _removeTodo(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        backgroundColor: Colors.pink.shade900,
        child: Icon(FeatherIcons.plus, size: 30, color: Colors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 8,
      ),
    );
  }
}
