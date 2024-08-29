import 'package:flutter/material.dart';
import 'package:food_application/view/drawer.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<String> allCategories = [
    "assets/firee.png",
    "assets/p3.jpg",
    "assets/p4.jpg",
    "assets/p2.jpg"
  ];

  List<String> text = ['All', 'Hot Dog', 'Burger', 'Pasta'];

  bool _isNewListVisible = false;

  List<String> newListItems = List.generate(10, (index) => 'Item $index');

  void _onCategoryClicked(int index) {
    if (index == 0) {
      setState(() {
        _isNewListVisible = true;
      });
    }
  }

  Widget _buildCategories() {
    return Container(
      height: 50, // Fixed height for the ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          Color cardColor = index == 0
              ? const Color(0xffffd37c)
              : const Color.fromARGB(255, 243, 237, 237);
          double containerWidth = index == 0 ? 85.0 : 105.0;

          return GestureDetector(
            onTap: () => _onCategoryClicked(index),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                elevation: 4,
                color: cardColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50), // Circular Card
                ),
                child: Container(
                  width: containerWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.amber,
                          backgroundImage: AssetImage(allCategories[index]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            text[index],
                            style: const TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNewList() {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: newListItems.length,
        itemBuilder: (context, index) {
          return SizedBox(
            // height: 100, // Fixed height for each item
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.brown),
              width: 130, // Fixed width for each item

              margin: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  newListItems[index],
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: const Color(0xffffffff),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DELIVER TO",
              style: TextStyle(
                color: Color(0xffff7622),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Halal Lab Office",
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                Icon(Icons.arrow_drop_down),
              ],
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              children: [
                Text(
                  "Hey Halal,",
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                Text(
                  " Good Afternoon!",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 239, 239),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 28,
                    ),
                    hintText: "Search dishes, restaurants",
                    hintStyle: TextStyle(
                      color: Colors.black38,
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "All Categories",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            _isNewListVisible ? _buildNewList() : _buildCategories(),
            const SizedBox(height: 22),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Open Restaurant",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "See All",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
