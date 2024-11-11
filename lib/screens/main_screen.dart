import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tab_bar_view/screens/profile_tab_screen.dart';
import 'package:tab_bar_view/screens/settings_tab_screen.dart';
import '../di/setup_locator.dart';
import '../view_models/tab_bar_view_model.dart';
import 'home_tab_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {
  final TabBarViewModel viewModel = getIt<TabBarViewModel>();

  final List<Widget> _tabs = [
    HomeTab(),
    SettingsTab(),
    ProfileTab(),
  ];

  @override
  void initState() {
    super.initState();
    viewModel.initTabController(this, _tabs.length);
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: viewModel,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar with MVVM Example'),
          bottom: TabBar(
            controller: viewModel.tabController,
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.settings), text: 'Settings'),
              Tab(icon: Icon(Icons.person), text: 'Profile'),
            ],
          ),
        ),
        body: Consumer<TabBarViewModel>(
          builder: (context, model, child) {
            return TabBarView(
              controller: model.tabController,
              children: _tabs,
            );
          },
        ),
      ),
    );
  }
}
