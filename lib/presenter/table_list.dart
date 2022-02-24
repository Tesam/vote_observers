import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class TableList extends StatelessWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Mesas",
            style: TextStyle(color: MyTheme.gray2Text),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: MyTheme.background,
        ),
        backgroundColor: MyTheme.background,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                          ),
                          filled: true),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 10.0),
                    child: CircleAvatar(
                      backgroundColor: MyTheme.primaryColor,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      maxRadius: 25,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.fromLTRB(20, 20, 8, 20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                RichText(
                                  text: const TextSpan(
                                    text: '2',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: '/150 asignados',
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.w400,
                                              color: MyTheme.gray2Text)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            IconButton(onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => Table())),
                              icon: const Icon(Icons.arrow_forward,),)
                          ],
                        )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
