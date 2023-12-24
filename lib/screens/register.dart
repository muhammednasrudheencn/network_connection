import 'package:flutter/material.dart';
import 'package:sample/const/color.dart';
import 'package:sample/screens/home.dart';
import 'package:sample/service/auth_service.dart';
import 'package:sample/service/data_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

final formkey = GlobalKey<FormState>();
final emailcontroller = TextEditingController();
final passwordcontroller = TextEditingController();
final confirmpassword = TextEditingController();
String email = '@gmail.com';

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final customsize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 150),
                const Text('Register',
                    style:
                        TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
                const Text('Create your own Account',
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
                    } else if (passwordcontroller.text.trim().length < 8) {
                      return 'Password must be at least 8 characters';
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: confirmpassword,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: cwhite,
                    hintText: 'Confirm Password',
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
                    if (confirmpassword.text.trim().isEmpty) {
                      return 'Please enter password';
                    } else if (passwordcontroller.text.trim().length < 8) {
                      return 'Password must be at least 8 characters';
                    } else if (passwordcontroller.text.trim() !=
                        confirmpassword.text.trim()) {
                      return 'Passwords not matching';
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
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        if (emailcontroller.text.trim().contains(email)) {
                          Map<String, dynamic> userData = {
                            'email': emailcontroller.text.trim(),
                            'password': passwordcontroller.text.trim()
                          };
                          fireStore.collection('User').add(userData);
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
                    child: const Text('Register',
                        style: TextStyle(color: cblack, fontSize: 16)),
                  ),
                ),
                const SizedBox(height: 200)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
