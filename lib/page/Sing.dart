// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:newproject/view_modle/Sign_VM.dart';

import '../modls/inf_User_M.dart';
import '../modls/srvise/user_serviceFirbase.dart';

class Sing extends StatefulWidget {
  const Sing({super.key});

  @override
  State<Sing> createState() => _SingState();
}

class _SingState extends State<Sing> {
  Users data = Users();
  final GlobalKey<FormState> _glonlfey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(image: AssetImage("assets/Backg.png"))),
        child: SingleChildScrollView(
          ///يا الطاهر هذي هيا الودجت لي قتلك عليها
          child: Form(
            // هذا المفتاح هو لي نفاليدي بيه الحقول كاملين
            key: _glonlfey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 25, top: 80),
                  child: Text(
                    "Sing in",
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 266,
                  height: 50,

                  /// الاسم full name
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                    },
                    onChanged: (password) {
                      data.password = password;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "   Password",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 266,
                  height: 50,
                  // Date of birth التاريخ
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                    },

                    /// يليق تريقيل يوجد خطا
                    onChanged: (Date) {
                      data.Date = Date;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "        Date of birth ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 266,
                  height: 50,
                  //العنوان
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                    },
                    onSaved: (newValue) {
                      data.address = newValue;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "        Full  address  ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 266,
                  height: 50,
                  //phone number رقم الهاتف
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                      return null;
                    },
                    onSaved: (newValue) {
                      data.phone = newValue;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "        Phone number ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 266,
                  height: 50,
                  //  Accont email
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                    },
                    onSaved: (newValue) {
                      data.email = newValue;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "        Accont amail  ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 22),
                  width: 266,
                  height: 50,
                  //Service
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty)
                        return "لايمكن ان ايكون هذا الحقل فارغ ";
                    },
                    onChanged: (value) => data.Srvice = value,
                    onSaved: (newValue) {
                      data.Username = newValue;
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "     Username ",
                      hintStyle: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xF4f4f4f4),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 60),
                  child: ElevatedButton(
                    //الطاهر هنا لازم المستخدم كي يدخل للالصفحة الرئسية لازم ديرلوا انوا ما يقدرش يرج للور باBrake
                    onPressed: () async {
                      if (_glonlfey.currentState!.validate()) {
                        _glonlfey.currentState!.save();
                        Users Add = Users();

                        ///درت في بلاصة كلمة المرور  اسم المستخدم
                        final email = data.email;
                        final password = data.password;

                        if (_glonlfey.currentState!.validate()) {
                          _glonlfey.currentState!.save();
                          // var datatojson = data.tojson();
                          await AddUser(Abstrctuser: Auth())
                              .Adduser(email!, password!, data, context);
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.yellow[400]),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(horizontal: 60, vertical: 15)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                    ),
                    child: Text(
                      "Sing in",
                      style: TextStyle(
                          fontSize: 23,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Text(
                  "By registering you agree to",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Privacy policy",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.yellow[700],
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
