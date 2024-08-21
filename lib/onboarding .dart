import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final List<String> images = [
    "assets/order1-removebg-preview.png",
    
    "assets/order3-removebg-preview.png",
    "assets/order-removebg-preview.png"
  ];
  List text=[
    'All your favorites',
    "Order from choosen chef","Free delivery offers",
  ];
 
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return SafeArea(
                    child: Column(
                     
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Image.asset(
                            images[index],
                             scale: 0.9,// Adjust the fit to cover the screen
                          ),
                        ),Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Text(text[index],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Get all your loved foods in one once place,\nyou just place the order, we do the rest",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      
                      ],
                    ),
                  );
                },
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
              ),
            ),
           Padding(
             padding: const EdgeInsets.only(bottom: 200),
             child: row(),
           ),  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            height: 53,
                            child: ElevatedButton(
                              onPressed: () {
                                print('Button pressed!');
                              },
                              child: Text( currentPage < images.length - 1 ? "Next" : "Get started",
                               
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffff7622),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text("Skip",style: TextStyle(fontSize: 14,fontWeight:FontWeight.bold ),),
                        )
          ],
        ),
      ),
    );
  }

  Widget row() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: Icon(
            index == currentPage ? Icons.circle : Icons.circle_outlined,
            size: 10,
            color: index == currentPage ? Colors.orange : Colors.grey,
          ),
        );
      }),
    );
  }
}
