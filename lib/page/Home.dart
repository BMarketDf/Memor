import 'package:flutter/material.dart';
import '../modls/srvise/firbase_Servse_to_Hom.dart';
import '../modls/srvise/user_serviceFirbase.dart';
import '../view_modle/Home_viwemodle.dart';
import '../view_modle/porofail_VM.dart';
// ignore: depend_on_referenced_packages
import 'package:connectivity_plus/connectivity_plus.dart';

import 'SearchDelegate.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  homeviwemodle homes = homeviwemodle(abstrecthome: HomeModlefirbase());
  String? userid;
  profaile_vm user = profaile_vm(Abstractuser: Auth());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  Widget getuseraddservice(String userid) {
    return FutureBuilder(
      future: user.getpe(userid),
      builder: (context, snapshot) {
        return !snapshot.hasData
            ? const SizedBox(
                height: 80,
              )
            : Row(
                children: [

                  Column(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            NetworkImage("${snapshot.data?.imgeurl}"),
                      ),
                      Text("${snapshot.data?.Username}"),
                    ],
                  )
                ],
              );
        // return ListView.builder(
        //   scrollDirection: Axis.horizontal,
        //   itemCount: snapshot.data?.length,
        //   itemBuilder: (context, index) => Row(
        //     children: [
        //       CircleAvatar(
        //         radius: 35,
        //         backgroundImage:
        //             NetworkImage("${snapshot.data?[index].imgeurl}"),
        //       ),
        //     ],
        //   ),
        // );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page"),
       actions: <Widget>[
        IconButton(onPressed: (){
          setState(() {
      showSearch(context: context, delegate: Serche());
          });
          }, icon: const Icon(Icons.search)),
        
       ],
      ),
      body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
        
            return snapshot.data == ConnectivityResult.none
                ? const Center(
                    child: Text("plese check your internt connection"))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(color: Colors.transparent),
                          width: double.infinity,
                          height: 50,
                          margin: const EdgeInsets.only(
                            top: 60,
                          ),
                          padding: const EdgeInsets.only(right: 10, left: 2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 20, right: 95),
                                height: 30,
                                width: 80,
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: const Size.fromHeight(30),
                                      backgroundColor: Colors.transparent,
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      'view all',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                              const FittedBox(
                                child: Text(
                                  'categories',
                                  style: TextStyle(
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   width: double.infinity,
                        //   height: 90,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Container(
                        //         child: CircleAvatar(
                        //           radius: 35,
                        //           backgroundImage: AssetImage(
                        //             'assets/person.jpg',
                        //           ),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: CircleAvatar(
                        //           radius: 35,
                        //           backgroundImage: AssetImage('assets/person.jpg'),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: CircleAvatar(
                        //           radius: 35,
                        //           backgroundImage: AssetImage('assets/person.jpg'),
                        //         ),
                        //       ),
                        //       Container(
                        //         child: CircleAvatar(
                        //           radius: 35,
                        //           backgroundImage: AssetImage('assets/person.jpg'),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Container(
                        //   margin: EdgeInsets.only(left: 20, right: 20),
                        //   width: double.infinity,
                        //   height: 40,
                        //   child: Center(
                        //     child: Text(
                        //       ' The most requested services',
                        //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        //     ),
                        //   ),
                        // ),
                        // FutureBuilder(
                        //     future: homes.fechAllservice(),
                        //     builder: (context, snapshot) {
                        //       return !snapshot.hasData
                        //           ? const  Center(
                        //               child: CircularProgressIndicator(),
                        //             )
                        //           : SizedBox(
                        //               height: 90,
                        //               child: ListView.builder(
                        //                 scrollDirection: Axis.horizontal,
                        //                 itemCount: snapshot.data!.length,
                        //                 itemBuilder: (context, index) {
                        //                   return getuseraddservice(snapshot
                        //                       .data![index].userid
                        //                       .toString());
                        //                 },
                        //               ),
                        //             );
                        //     }),
                        Container(
                          width: double.infinity,
                          height: 190,
                          margin: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 120),
                                  height: 180,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image:
                                              AssetImage("assets/pic2.png"))),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    child: Text(
                                      " Service name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.only(top: 120),
                                  height: 180,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      image: DecorationImage(
                                        image: AssetImage("assets/pic2.png"),
                                      )),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushNamed(context, '/Dommend');
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.transparent),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 10)),
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                    child: Text(
                                      " Service name",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ]),
                        ),
                        Container(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                height: 30,
                                width: 80,
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size.fromHeight(35),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'view all',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 6),
                          width: double.infinity,
                          height: 40,
                          child: Center(
                            child: Text(
                              ' Busy business',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'Find a sculptor',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'Find a barber',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'Find a cook',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                height: 30,
                                width: 80,
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size.fromHeight(35),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'view all',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 20, right: 20, bottom: 6),
                          width: double.infinity,
                          height: 40,
                          child: Center(
                            child: Text(
                              ' Job seekers',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'I am sculptor',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'I am a cooker',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(left: 30, right: 30, bottom: 10),
                          padding: EdgeInsets.only(right: 20),
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[300]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/Det');
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_rounded,
                                    color: Colors.amber,
                                    size: 30,
                                  )),
                              Text(
                                'I am a barber',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 20,
                                ),
                                height: 30,
                                width: 80,
                                child: ElevatedButton(
                                    style: OutlinedButton.styleFrom(
                                      elevation: 0,
                                      minimumSize: Size.fromHeight(35),
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'view all',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
          }),
    );
  }
}
