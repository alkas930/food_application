import 'package:flutter/material.dart';
import 'package:hive/hive.dart'; // Assuming you use Hive for local storage

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  late Future<String> _userNameFuture;

  @override
  void initState() {
    super.initState();
    _userNameFuture = _fetchUserName();
  }

  Future<String> _fetchUserName() async {
    try {
      var box = await Hive.openBox('logindata');
      String? userName = box.get('name');
      return userName ?? 'Guest';
    } catch (e) {
      print('Error fetching user name: $e');
      return 'Guest'; // Default value in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> text = [
      "Personal Info",
      "Addresses",
      "Cart",
      "Favorites",
      "Notifications",
      "Payment Method",
      "FAQs",
      "Users Reviews",
      "Settings",
      "Log Out",
    ];
    final List<IconData> icon = [
      Icons.person_outline,
      Icons.description_outlined,
      Icons.shopping_cart_outlined,
      Icons.favorite_border_outlined,
      Icons.notification_add_outlined,
      Icons.payment_outlined,
      Icons.question_mark_rounded,
      Icons.reviews_outlined,
      Icons.settings_outlined,
      Icons.logout_outlined,
    ];

    final List<Color> iconColors = [
      Colors.orange,
      Colors.purple,
      Colors.blue,
      Colors.pink,
      Colors.amber,
      Colors.blue,
      Colors.red,
      Colors.blueAccent,
      Colors.purple,
      Colors.red,
    ];

    List<Widget> _buildGroupedItems() {
      List<Widget> groupedItems = [];
      int index = 0;

      List<int> groupSizes = [2, 4, 3, 1];

      for (int groupSize in groupSizes) {
        List<Widget> group = [];
        for (int i = 0; i < groupSize; i++) {
          if (index >= text.length) break;
          group.add(
            ListTile(
              title: Text(
                text[index],
                style: TextStyle(fontSize: 12),
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 13,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                maxRadius: 17,
                child: Icon(
                  icon[index],
                  size: 18.5,
                  color: iconColors[index],
                ),
              ),
            ),
          );
          index++;
        }

        groupedItems.add(
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Color(0xfff5f9fc),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: group,
                ),
              ),
            ),
          ),
        );
      }

      return groupedItems;
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Drawer(
          backgroundColor: Color(0xffffffff),
          child: FutureBuilder<String>(
            future: _userNameFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              }

              final userName = snapshot.data ?? 'Guest';

              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 17,
                                backgroundColor: Color(0xffeceff6),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/home');
                                  },
                                  icon: const Icon(
                                    Icons.arrow_back_ios_new,
                                    size: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Text("Profile"),
                            ],
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 17,
                                backgroundColor: Color(0xffeceff6),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, '/login');
                                  },
                                  icon: const Icon(
                                    Icons.more_horiz_outlined,
                                    size: 18,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        children: [
                          Image.asset("assets/per.png", scale: 4),
                          SizedBox(width: 23),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(userName,
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 2),
                              Text(
                                "I love fast food",
                                style: TextStyle(fontSize: 11),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // Grouped items
                    ..._buildGroupedItems(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
