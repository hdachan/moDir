import 'package:flutter/material.dart';

class TestView extends StatefulWidget {
  @override
  State<TestView> createState() => _TestViewState();
}

void main() {
  runApp(MaterialApp(
    home: TestView(),
  ));
}

class _TestViewState extends State<TestView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

    _tabController.addListener(
        () => setState(() => _selectedIndex = _tabController.index));
  }

  @override
  void dispose() {
    _tabController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Title"),
      ),
      bottomNavigationBar: SizedBox(
        height: 62,
        child: TabBar(
          indicatorColor: Colors.transparent,
          labelColor: Colors.black,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(
                _selectedIndex == 0 ? Icons.person : Icons.person_2_outlined,
              ),
              text: "Friends",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 1 ? Icons.chat : Icons.chat_outlined,
              ),
              text: "Chats",
            ),
            Tab(
              icon: Icon(
                _selectedIndex == 2 ? Icons.settings : Icons.settings_outlined,
              ),
              text: "Settings",
            ),
          ],
        ),
      ),
      body: _selectedIndex == 0
          ? tabContainer(context, Colors.indigo, "Friends Tab")
          : _selectedIndex == 1
              ? tabContainer(context, Colors.amber[600]!, "Chats Tab")
              : tabContainer(context, Colors.blueGrey, "Settings Tab"),
    );
  }

  Container tabContainer(BuildContext context, Color tabColor, String tabText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: tabColor,
      child: Center(
        child: Text(
          tabText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
