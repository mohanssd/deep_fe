import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Layout extends StatelessWidget {
  String title = 'Home';
  Widget body;
  Layout({super.key, required this.body, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        elevation: 20.0,
        shadowColor: Colors.black,
        title: Text(title),
        actions: [
          ElevatedButton(
              onPressed: () => print('wow'), child: const Text('Hyy there'))
        ],
      ),
      body: body,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: ElevatedButton(
                child: Text('Drawer Header'),
                onPressed: () => context.go('/'),
              ),
            ),
            ListTile(
              title: Text('Regression'),
              onTap: () => context.go('/regression'),
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () => print('Say 2'),
            )
          ],
        ),
      ),
    );
  }
}
