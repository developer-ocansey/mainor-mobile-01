import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:simplecalculator/models/history_model.dart';
import 'package:simplecalculator/services/firebase_service.dart';
import 'package:simplecalculator/services/history_service.dart';

class HistoryScreen extends StatefulWidget {
  @override
  HistoryScreenState createState() => new HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  List<History> _values = FirebaseService().getDocuments("history");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previous calculations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView.separated(
            itemCount: _values.length,
            padding: const EdgeInsets.all(5.0),
            separatorBuilder: (context, index) => Divider(
                  color: Colors.black,
                ),
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('item ${_values[index].cid}'),
                background: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(Icons.delete, color: Colors.white),
                        Text('Remove', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),
                ),
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Delete Confirmation"),
                        content: const Text(
                            "Are you sure you want to delete this item?"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const Text("Delete")),
                          FlatButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text("Cancel"),
                          ),
                        ],
                      );
                    },
                  );
                },
                onDismissed: (DismissDirection direction) {
                  HistoryService().deleteByID(_values[index].cid);
                  print('Remove item');
                  setState(() {
                    _values.removeAt(index);
                  });
                },
                child: ListTile(
                  leading: Icon(Icons.local_activity, size: 50),
                  title: Text(_values[index].operation),
                ),
              );
            }),
      ),
    );
  }
}
