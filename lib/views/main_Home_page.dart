import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food/constants/helpers.dart';
import 'package:food/views/home_page.dart';
import 'package:food/widgets/big_text_widget.dart';

class MainHomePage extends ConsumerStatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainHomePageState();
}

class _MainHomePageState extends ConsumerState<MainHomePage> {
  int selectedIndex = 0;
  List<Widget> pages = [
    const HomePage(),
    Text("data2"),
    Text("data3"),
    Text("data4")
  ];
  void _onSelectedItem(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Helpers.foodBlack54),
        backgroundColor: Helpers.foodWhite,
        title: BigTextWidget(
          text: "Bostone",
          color: Helpers.foodorange800,
          size: 20,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: 20,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2015/01/06/16/14/woman-590490__340.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
          )
        ],
      ),
      // !this is the sidebar
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Helpers.foodWhite,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                decoration: const BoxDecoration(color: Helpers.foodWhite),
                child: CircleAvatar(
                  backgroundColor: Helpers.foodWhite,
                  maxRadius: 40,
                  child: Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(65),
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://cdn.pixabay.com/photo/2015/11/26/00/14/woman-1063100__340.jpg'),
                            fit: BoxFit.cover)),
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 20, right: 10, left: 10),
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Row(
                  children: const [
                    BigTextWidget(text: "Name: "),
                    SizedBox(
                      width: 20,
                    ),
                    BigTextWidget(text: "Mulati Brian")
                  ],
                )),
            Container(
                margin: const EdgeInsets.only(
                    top: 20, right: 10, left: 10, bottom: 30),
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 10,
                ),
                child: Row(
                  children: const [
                    BigTextWidget(text: "Email: "),
                    SizedBox(
                      width: 20,
                    ),
                    BigTextWidget(text: "mulati@mulati.com")
                  ],
                )),
            ListTile(
              leading: Icon(
                Icons.currency_ruble_sharp,
                size: 30,
                color: Helpers.foodorange800,
              ),
              title: BigTextWidget(
                text: "Popular",
                color: Helpers.foodorange800,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.currency_rupee,
                size: 30,
                color: Helpers.foodorange800,
              ),
              title: BigTextWidget(
                text: "Recommended",
                color: Helpers.foodorange800,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.dining_outlined,
                size: 30,
                color: Helpers.foodorange800,
              ),
              title: BigTextWidget(
                text: "Menu",
                color: Helpers.foodorange800,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.lock_outline,
                size: 30,
                color: Helpers.foodred700,
              ),
              title: BigTextWidget(
                text: "Logout",
                color: Helpers.foodred700,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: pages[selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Helpers.foodorange800,
          unselectedItemColor: Helpers.foodorange600,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          onTap: _onSelectedItem,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  color: Helpers.foodorange800,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Helpers.foodorange800,
                ),
                label: "Account"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_basket,
                  color: Helpers.foodorange800,
                ),
                label: "History"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: Helpers.foodorange800,
                ),
                label: "Notification"),
          ]),
    );
  }
}
