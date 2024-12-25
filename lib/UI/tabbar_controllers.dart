import 'package:flutter/material.dart';

class TabbarChallengeView extends StatefulWidget {
  const TabbarChallengeView({super.key});

  @override
  State<TabbarChallengeView> createState() => _TabbarChallengeViewState();
}

class _TabbarChallengeViewState extends State<TabbarChallengeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: 4, vsync: this); // TabController oluşturuluyor
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController'ı temizliyoruz
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tabbar Challenge'),
        bottom: TabBar(
          controller: _tabController, // TabController'ı burada bağlıyoruz
          tabs: const [
            Tab(
              icon: Icon(Icons.home),
              text: 'Home',
            ),
            Tab(
              icon: Icon(Icons.search),
              text: 'Search',
            ),
            Tab(
              icon: Icon(Icons.notifications),
              text: 'Notifications',
            ),
            Tab(
              icon: Icon(Icons.settings),
              text: 'Settings',
            ),
          ],
          indicatorColor: Colors.green,
          indicatorWeight: 4,
          unselectedLabelColor: Colors.grey,
          labelColor: Colors.white,
        ),
      ),
      body: TabBarView(
        controller: _tabController, // TabController'ı burada da bağlıyoruz
        children: const [
          Center(
            child: Text('Home View'),
          ),
          Center(
            child: Text('Search View'),
          ),
          Center(
            child: Text('Notifications View'),
          ),
          Center(
            child: Text('Settings View'),
          ),
        ],
      ),
    );
  }
}
