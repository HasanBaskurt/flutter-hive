import 'package:flutter/material.dart';
import 'package:hive_app/app_storage.dart';
import 'package:hive_app/model/user.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade800,
        title: const Text(
          'Hive',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: buildBody(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFloatActionButton(),
    );
  }

  Widget buildBody() {
    return ValueListenableBuilder(
        valueListenable: AppStorage.localBox.listenable(),
        builder: (context, box, widget) {
          int counter = box.get('counter', defaultValue: 0);
          User user =
              box.get('user', defaultValue: User(email: '-', password: '-'));
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'User Information',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber.shade800,
                  ),
                ),
                Text(user.email),
                Text(user.password),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade800,
                    ),
                    onPressed: () async {
                      box.put('user',
                          User(email: 'hasan@gmail.com', password: '123456'));
                    },
                    child: const Text('Save')),
                Text(
                  'Counter',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.amber.shade800,
                  ),
                ),
                Text(counter.toString())
              ],
            ),
          );
        });
  }

  Widget buildFloatActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            backgroundColor: Colors.amber.shade800,
            child: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              AppStorage.localBox.delete('counter');
            }),
        FloatingActionButton(
            backgroundColor: Colors.amber.shade800,
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () async {
              int counter =
                  await AppStorage.localBox.get('counter', defaultValue: 0);
              counter++;
              AppStorage.localBox.put('counter', counter);
            })
      ],
    );
  }
}
