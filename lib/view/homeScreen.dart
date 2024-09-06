import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_application/Api/recipes.dart';
import 'package:food_application/model/recipesmodel.dart';
import 'package:http/http.dart' as http;

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<Map<String, dynamic>> _food = [];

  Future<void> getRecipes() async {
    try {
      final response = await http.get(Uri.parse("https://dummyjson.com/recipes?limit=10&skip=10&select=name,image"));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          _food = List<Map<String, dynamic>>.from(data['recipes']);
        });
      } else {
        throw Exception('Failed to load recipes');
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  List text1 = ["Hot dog", "Burger", "Pasta", "Hot dog"];
  List allCategories = [
    "assets/firee.png",
    "assets/p3.jpg",
    "assets/p4.jpg",
    "assets/p2.jpg"
  ];
  List price = ["70", "50", "60", "90"];

  List allCategories1 = [
    "assets/p3.jpg",
    "assets/p4.jpg",
    "assets/p2.jpg", 
    "assets/p3.jpg",
  ];

  List text = ['All', 'Hot Dog', 'Burger', 'Pasta'];

  bool _isNewListVisible = false;

  void _onCategoryClicked(int index) {
    setState(() {
      _isNewListVisible = index == 0;
    });
  }

late List<Recipe>_recipes;

final ApiService _apiService=ApiService();

Future<void> _fetchData() async {
    try {
      final response = await _apiService.fetchRecipes();
      setState(() {
        _recipes = response.recipes;
        
      });
    } catch (e) {
      
    }
  }










  Widget _buildCategories() {
    return Container(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories.length,
        itemBuilder: (context, index) {
          Color cardColor = index == 0
              ? Color(0xffffd37c)
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
                  borderRadius: BorderRadius.circular(50),
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
                            style: TextStyle(
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
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: allCategories1.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 1,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Container(
              width: 100,
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(allCategories1[index], scale: 2),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          text1[index],
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Starting",
                              style: TextStyle(color: const Color.fromARGB(255, 114, 114, 114), fontSize: 10),
                            ),
                            Text(
                              price[index],
                              style: TextStyle(color: Color.fromARGB(255, 114, 114, 114), fontSize: 10),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
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
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffffffff),
        title: Column(
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
      drawer: Drawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
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
            SizedBox(height: 15),
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
            SizedBox(height: 15),
            Row(
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
            SizedBox(height: 15),
            _isNewListVisible ? _buildNewList() : _buildCategories(),
            SizedBox(height: 22),
            Row(
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
            Expanded(
              child: ListView.builder(
                    itemCount: _recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = _recipes[index];
                      return
                      //  ListTile(
                      //   leading: Image.network(recipe.image),
                      //   title: Text(recipe.name),
                      // );
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 140,width: 160,child: Column(
                          children: [Image.network(recipe.image,fit: BoxFit.cover,),
                            // Text(recipe.name),
                          ],
                        ),),
                      );
                    },
                  ),
            ),
                      ],
                    ),
                  ));
                }
            
  }

