import 'package:flutter/material.dart';


class MainBoard extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<MainBoard> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  int _tabIndex = 0;
  List<String> posts = [];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _tabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      var i = _selectedIndex = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _tabIndex = index;
      _tabController.index = index;
    });
  }

  void _addPost(String content) {
    setState(() {
      posts.add(content);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/macaron_appbarlogo.png', // 상단바 왼쪽 로고
                  height: 32,
                ),
                SizedBox(width: 8),

              ],
            ),
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {}, // 알림 아이콘 클릭 이벤트 추가 가능
            ),
          ],
        ),
        centerTitle: false,
      ),

      //여기서부터는 Body
      body: Column(
        children: [
          Container(
            color: Colors.blue[100],
            height: 200,
            alignment: Alignment.center,
            child: Text(
              "brand info",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              TabBar(
                controller: _tabController,
                onTap: _onTabTapped,
                tabs: [
                  Tab(text: "추천"),
                  Tab(text: "팔로잉"),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
              ),
              Positioned(
                bottom: 0,
                left: MediaQuery.of(context).size.width * (_tabIndex == 0 ? 0 : 0.5),
                child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  height: 2,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                PostSection(posts: posts), // 추천 섹션
                PostSection(posts: posts), // 팔로잉 섹션
              ],
            ),
          ),
        ],
      ),

        bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Container(
          height: 60, //위젯 크기 증가
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => _onBottomNavTapped(0),
                child: Image.asset(
                  'assets/board_widget.png',
                  width: 48,
                  height: 48,
                  color: _selectedIndex == 0 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () => _onBottomNavTapped(1),
                child: Icon(
                  Icons.search,
                  size: 36,
                  color: _selectedIndex == 1 ? Colors.black : Colors.grey,
                ),
              ),
              GestureDetector(
                onTap: () => _onBottomNavTapped(2),
                child: Image.asset(
                  'assets/macaron_bottombar_widget.png',
                  width: 48,
                  height: 48,
                  color: _selectedIndex == 2 ? Colors.black : Colors.grey,
                ),
              ),
               GestureDetector(
                 onTap: () => _onBottomNavTapped(3),
                 child: Icon(
                   Icons.person,
                   size: 36,
                   color: _selectedIndex == 3 ? Colors.black : Colors.grey,
                 ),
               ),
            ],
          ),
        ),
        ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text("Home Page")),
    );
  }
}

// 밑에 네 개의 클래스는 하단 위젯 네 개를 누를 때 호출하는 클래스를 임시로 작성한 것
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search")),
      body: Center(child: Text("Search Page")),
    );
  }
}

class MacaronPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Macaron")),
      body: Center(child: Text("Macaron Page")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Page")),
    );
  }
}
// 여기까지 하단 위젯 네개 임시 클래스



class _tabController {
}

class PostSection extends StatelessWidget {
  final List<String> posts;

  const PostSection({required this.posts});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(posts[index]),
        );
      },
    );
  }
}