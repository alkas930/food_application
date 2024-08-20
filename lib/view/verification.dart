import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Verification extends StatefulWidget {
  const Verification({super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
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
                      "Verification",
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
                    "We have sent a code to your email",
                    style: TextStyle(color: Color(0xfff4f4f5), fontSize: 12),
                  ),
                ),
                Center(
                  child: Text(
                    "example@gmail.com",
                    style: TextStyle(
                        color: Color(0xfff4f4f5),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "CODE",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "Resend",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.black54,
                                    fontSize: 12,
                                    height: 2,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                " in.50sec",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Pinput(
                        length: 4,
                        defaultPinTheme: PinTheme(
                            height: 56,
                            width: 56,
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 240, 239, 239),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)))),
                      ),
                      const SizedBox(
                        height: 20,
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
                              'VERIFY',
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
