import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatefulWidget {
  const Forgotpassword({super.key});

  @override
  State<Forgotpassword> createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<Forgotpassword> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendResetEmail() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email: _emailController.text.trim(),
        );
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password reset email sent!')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${e.toString()}')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xfff4f4f5),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 5),
                Center(
                  child: Text(
                    "Please enter your email to receive a password reset link",
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EMAIL",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xfff0f5fa),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your email';
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                                  .hasMatch(value)) {
                                return 'Please enter a valid email address';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "example@gmail.com",
                              hintStyle: TextStyle(
                                color: Color(0xffbec3d2),
                                fontSize: 12.5,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: size.width,
                            height: 53,
                            child: ElevatedButton(
                              onPressed: _sendResetEmail,
                              child: Text(
                                'RESET PASSWORD',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
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
                        SizedBox(height: 25),
                      ],
                    ),
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
