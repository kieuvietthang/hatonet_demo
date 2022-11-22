// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hatonet_demo/app/module/res/colors.dart';

class SignUpPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const SignUpPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = new TextEditingController();
  final _passwordController = new TextEditingController();
  final _companyController = new TextEditingController();
  final _contactnameController = new TextEditingController();
  final _phoneController = new TextEditingController();
  final _confirmpasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmpasswordController.dispose();
    _companyController.dispose();
    _contactnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  bool _secureText = true;
  bool _secureText1 = true;

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if(!isValid) return;
    // create user
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());

      // add user details
      addUserDetails(
          _companyController.text.trim(),
          _contactnameController.text.trim(),
          _phoneController.text.trim(),
          _emailController.text.trim());
    } else {
      if (formKey.currentState!.validate()) {
        final snackbar = SnackBar(content: Text('Submitting form'));
        _scaffoldKey.currentState!.showSnackBar(snackbar);
      }
    }
    Navigator.of(context).pop();
  }

  Future addUserDetails(String companyName, String contactName, String phone,
      String email) async {
    await FirebaseFirestore.instance.collection('user').add({
      'contact name': contactName,
      'company name': companyName,
      'phone': phone,
      'email': email
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmpasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.white,
            height: double.infinity,
            width: double.infinity,
            child: SizedBox(
              height: 20,
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SvgPicture.asset(
                              'assets/icons/ic_angle_left.svg',
                              height: 24,
                              width: 24,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      child: SvgPicture.asset('assets/images/img_logo_hatonet.svg'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          'Tiếp cận hàng ngàn nhân sự chất lượng từ các \ndoanh nghiệp ở khắp mọi nơi',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Không được bỏ trống';
                          } else {
                            return null;
                          }
                        },
                        controller: _companyController,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        cursorColor: Color(0xFFFF6116),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Tên công ty',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF6116), width: 2),
                          ),),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty ||
                              !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                            return 'Không được bỏ trống';
                          } else {
                            return null;
                          }
                        },
                        controller: _contactnameController,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        cursorColor: Color(0xFFFF6116),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Tên liên hệ',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(

                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF6116), width: 2),
                          ),),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (value)  {
                          //a.aaba@aa1a_a.com
                          if (value!.isEmpty) {
                            return 'Không được để trống';
                          } else if (!RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]+$')
                              .hasMatch(value)) {
                            return 'Sai định dạng. Vui lòng thử lại.';
                          } else {
                            return null;
                          }
                        },
                        controller: _phoneController,
                        keyboardType: TextInputType.number,
                        maxLines: 1,
                        cursorColor: Color(0xFFFF6116),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Số điện thoại',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF6116), width: 2),
                          ),),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        validator: (value) {
                          //a.aaba@aa1a_a.com
                          if (value!.isEmpty) {
                            return 'Không được để trống';
                          } else if (!RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return 'Sai định dạng. Vui lòng thử lại.';
                          } else {
                            return null;
                          }
                        },
                        controller: _emailController,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        cursorColor: Color(0xFFFF6116),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Email',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color(0xFFFF6116), width: 2),
                        ),),

                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: TextFormField(
                        validator: (value)  {
                          if (value!.isEmpty) {
                            return 'Không được để trống';
                          } else if (value.length < 6) {
                            return 'Mật khẩu phải trên 6 kí tự';
                          } else {
                            return null;
                          }
                        },
                        controller: _passwordController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        cursorColor: Color(0xFFFF6116),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Mật khẩu',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF6116), width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye,color: Color(0xFFFF6116),),
                            onPressed: () {
                              setState(() {
                                _secureText = !_secureText;
                              });
                            },
                          ),
                        ),
                        obscureText: _secureText,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: TextFormField(
                        validator: (value)  {
                          if (value!.isEmpty) {
                            return 'Không được để trống';
                          } else if (value.length < 6) {
                            return 'Mật khẩu phải trên 6 kí tự';
                          } else {
                            return null;
                          }
                        },
                        cursorColor: Color(0xFFFF6116),
                        controller: _confirmpasswordController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(13),
                          labelText: 'Xác nhận mật khẩu',
                          labelStyle: TextStyle(fontSize: 14,color: Color(0xFFFF6116),
                            fontWeight: FontWeight.w300,),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xFFFF6116), width: 2),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye,color: Color(0xFFFF6116),),
                            onPressed: () {
                              setState(() {
                                _secureText1 = !_secureText1;
                              });
                            },
                          ),
                        ),
                        obscureText: _secureText1,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: GestureDetector(
                        onTap: signUp,
                        child: Container(
                          decoration: BoxDecoration(
                              color: kColorFF6116,
                              borderRadius: BorderRadius.circular(4)),
                          height: 45,
                          width: double.infinity,
                          child: Center(
                            child: Text(
                              'Đăng ký',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ),
            ),
          ),
        ));
  }
}
