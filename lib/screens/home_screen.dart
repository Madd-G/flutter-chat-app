import 'package:flutter/material.dart';
import 'package:chat/widgets/calls_tab.dart';
import 'package:chat/widgets/chats_tab.dart';
import 'package:chat/widgets/story_tab.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = "Home Screen";

  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            unselectedLabelColor: Colors.black26,
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            tabs: [
              new Tab(
                text: 'Story',
              ),
              Row(
                children: <Widget>[
                  new Tab(
                    text: 'Chats',
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5),
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        '18',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ), // display sum of chats
                  ),
                ],
              ),
              new Tab(
                text: 'Calls',
              ),
            ],
            controller: _tabController,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.tab,
          ),
          bottomOpacity: 1,
        ),
      ),
      body: DoubleBackToCloseApp(
        snackBar: SnackBar(
          backgroundColor: Colors.blueAccent,
          content: Text(
            'Tap back again to leave',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        child: Material(
          color: Colors.white,
          child: TabBarView(
            children: [
              StoryTab(),
              ChatsTab(),
              CallsTab(),
            ],
            controller: _tabController,
          ),
        ),
      ),
//      extendBody: true,  //If you want to show body behind the navbar, it should be true
//      bottomNavigationBar: CustomNavigationBar(),
    );
  }
}
