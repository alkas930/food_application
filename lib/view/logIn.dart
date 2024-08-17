import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 90),
                  child: Center(
                    child: Text(
                      "Log In",
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
                    "Please sign in to your existing account",
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
                decoration: BoxDecoration(
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
                      Text(
                        "EMAIL",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "example@gmail.com",
                              hintStyle: TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10)),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "PASSWORD",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "123456789",
                              hintStyle: TextStyle(
                                  color: Color(0xffbec3d2), fontSize: 12.5),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.visibility),
                                color: Color(0xffbec3d2),
                              )),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: ischecked,
                            onChanged: (bool? value) {
                              setState(() {
                                ischecked = value ?? true;
                              });
                            },
                          ),
                          Text(
                            'Remember me',
                            style: TextStyle(fontSize: 12),
                          ),
                          Spacer(),
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xffffaa77)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
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
                            child: Text(
                              'LOG IN',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffff7622),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: const Color.fromARGB(221, 66, 66, 66),
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '  SIGN UP',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: Color(0xffffaa77)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(child: Text("Or")),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(255, 93, 4, 209),
                            radius: 30,
                            child: Icon(
                              Icons.phone,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 30,
                            child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                          SizedBox(width: 20),
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 30,
                            child: Icon(
                              Icons.email,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ],
                      )
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
