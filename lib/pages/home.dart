import 'package:bottom_bar/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:i_collab/widgets/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          VideoPlayerWidget(),
          Container(color: Colors.red),
          Container(color: Colors.yellow),
          Container(color: Colors.green),
          Container(color: Colors.pink.shade900),
        ],
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        }
      ),
      bottomNavigationBar: BottomBar(
        backgroundColor: Colors.black,
        selectedIndex: _currentPage,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() => _currentPage = index);
        },
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Inicio'),
            activeColor: Colors.blue
          ),
          BottomBarItem(
            icon: const Icon(Icons.price_change_rounded),
            title: const Text('Busqueda'),
            activeColor: Colors.red.shade300
          ),
          BottomBarItem(
            icon: const Icon(Icons.add_rounded),
            title: const Text('Salir'),
            activeColor: Colors.yellow.shade700
          ),
          BottomBarItem(
            icon: const Icon(Icons.message_rounded),
            title: const Text('Favoritos'),
            activeColor: Colors.green.shade400
          ),
          BottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Favoritos'),
            activeColor: Colors.green.shade400
          ),
        ],
      )
    );
  }
}