import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool ischecked = false;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Background Image
            Container(
              height: size.height,
              width: size.width,
              child: Image.asset(
                'assets/bg.jpg',
                fit: BoxFit.cover,
              ),
            ),

            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 90),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xfff4f4f5),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Center(
                  child: Text(
                    "Please sign Up to get started",
                    style: TextStyle(color: Color(0xfff4f4f5), fontSize: 12),
                  ),
                ),
                Spacer(),
              ],
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: size.height / 1.45,
                width: size.width,
                decoration: const BoxDecoration(
                  color: Color(0xffffffff),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "NAME",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "John doe",
                              hintStyle: TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "EMAIL",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "example@gmail.com",
                              hintStyle: TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "PASSWORD",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "123456789",
                              hintStyle: const TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility),
                                color: const Color(0xffbec3d2),
                              )),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "RE-TYPE PASSWORD",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "123456789",
                              hintStyle: const TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.visibility),
                                color: const Color(0xffbec3d2),
                              )),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: size.width,
                          height: 53,
                          child: ElevatedButton(
                            onPressed: () {
                              print('Button pressed!');
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
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
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
