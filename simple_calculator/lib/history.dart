/* screens/history.dart */

import 'package:flutter/material.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final history = Provider.of > (context);

    return Scaffold(
        appBar: AppBar(
          title: Text('History'),
          actions: [
            IconButton(
              icon: Icon(
                Icons.cancel,
                size: 30.0,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
        body: (history != null)
            ? ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(history[index].operation),
                    trailing: Text(history[index].timeStamp),
                    onTap: () {
                      history.removeOperation(history[index]._uuid);
                    },
                  );
                })
            : Center(child: CircularProgressIndicator()));
  }
}
