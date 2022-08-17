import 'package:cima/app/modules/HomePageBody/controllers/media_controller.dart';
import 'package:cima/app/modules/HomePageBody/views/home_page_body.dart';
import 'package:cima/app/components/home_page_drawer.dart';
import 'package:flutter/material.dart';
//import other screens preparation for the bottom navigation bar
import 'package:cima/app/routes/movie_info.dart';
import 'package:cima/app/routes/content.dart';
import 'package:cima/app/components/search_delegate.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  MediaController mediaController = Get.put(MediaController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const HomePageBody(),
      const MovieInfoScreen(),
      const Content(),
    ];

    return Scaffold(
      drawer: const HomePageDrawer(),
      backgroundColor: const Color.fromRGBO(14, 19, 49, 1),
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                  context: context,
                  delegate: SearchInHome(mediaController: mediaController));
            },
          ),
        ],
        centerTitle: true,
        title: const Text('سيما'),
        backgroundColor: const Color.fromRGBO(14, 19, 49, 1),
      ),
      body: pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(14, 19, 49, 1),
        unselectedItemColor: Colors.white54,
        selectedItemColor: Colors.white,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'القائمة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'حول',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'مشاهدة وتحميل',
          ),
        ],
      ),
    );
  }

  // ListView drawerNestedListTile(AsyncSnapshot<dynamic> snapshot, int index) {
  //   return ListView.builder(
  //       itemCount: snapshot.data[index]["children"].length,
  //       itemBuilder: (context, index2) {
  //         return ListTile(
  //           title: Text("${snapshot.data[index]["children"][index2]["name"]}"),
  //         );
  //       });
  // }

}
