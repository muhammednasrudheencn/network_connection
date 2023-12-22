import 'package:flutter/material.dart';
import 'package:sample/const/color.dart';
import 'package:sample/const/widget.dart';
import 'package:sample/screens/home.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

final formkey = GlobalKey<FormState>();
final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();
String email = '@gmail.com';

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 300),
                const Text('Login',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const Text('Please enter your email and password',
                    style: TextStyle(fontSize: 15)),
                const SizedBox(height: 20),
                TextFormField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cwhite,
                    hintText: 'email',
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: cred)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: cred)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100)),
                  ),
                  validator: (value) {
                    if (emailcontroller.text.trim().isEmpty) {
                      return 'Please enter your email';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cwhite,
                    hintText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100)),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: cred)),
                    errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(color: cred)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100)),
                  ),
                  validator: (value) {
                    if (passwordcontroller.text.trim().isEmpty) {
                      return 'Please enter password';
                    } else if (passwordcontroller.text.trim().length <= 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            customsize.width * 0.8, customsize.height * 0.06)),
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        if (emailcontroller.text.trim().contains(email)) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => const HomeScreen()));
                        } else {
                          print('its not a email');
                        }
                      } else {
                        return;
                      }
                    },
                    child: const Text('Sign-in',
                        style: TextStyle(color: cblack, fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 10),
                const Row(children: <Widget>[
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3),
                    child: Text("OR", style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider()),
                ]),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                            customsize.width * 0.8, customsize.height * 0.06)),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: customsize.height * 0.03,
                          // decoration: BoxDecoration(color: Colors.blue),
                          child: Image.network(
                            google,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        const Text(
                          'Sign-in with Google',
                          style: TextStyle(color: cblack, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
