import 'package:flutter/material.dart';
import 'package:receitasdomazza/screens/favorite_screen.dart';
import 'package:receitasdomazza/screens/categories_screen.dart';
import '../components/main_drawer.dart';

class TabsScreen extends StatefulWidget {

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String?, Object?>> _screens = [
    { 'title': 'Lista de Categorias', 'screen': CategoriesScreen() },
    { 'title': 'Meus Favoritos', 'screen': FavoriteScreen() },
  ];

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoritos'
          ),
        ],
      ),
    );    
  }
}