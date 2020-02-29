import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skill_share_project/data/classification_model.dart';
import 'package:skill_share_project/screens/reviews_screen.dart';
import 'package:skill_share_project/screens/classifications_screen.dart';
import 'package:skill_share_project/widgets/menu_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('AppBar'),
        ),
        body: ListView(
          children: <Widget>[
            MenuItem("Comentários", "Lista de comentários para revisão",
                ReviewsScreen.routeName, Icons.list),
            MenuItem("Configurações", "Configurações para treinamento de IA",
                ClassificationsScreen.routeName, Icons.edit)
          ],
        ),
      ),
      routes: {
        ReviewsScreen.routeName: (context) => ReviewsScreen(),
        ClassificationsScreen.routeName: (context) => ClassificationsScreen()
      },
    );
  }
}
