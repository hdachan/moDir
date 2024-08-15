import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: test(),
    );
  }
}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 탭 개수
      child: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              expandedHeight: 580,
              flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset('assets/image/logo_modi.png')),
              bottom: TabBar(
                tabs: const <Widget>[
                  Tab(text: '1'),
                  Tab(text: '2'),
                  Tab(text: '3'),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: const <Widget>[
                  Center(child: Text('테스트')),
                  Center(child: Text('테스트')),
                  Center(child: Text('테스트')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
