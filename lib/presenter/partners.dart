import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class Partners extends StatelessWidget {
  const Partners({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Socios",
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
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(vertical: 10,),
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: MyTheme.primaryColor
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(right: 8),
                      child: Text("San Juan", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(right: 8),
                      child: Text("San Ignacio", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(right: 8),
                      child: Text("Ayolas", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(right: 8),
                      child: Text("Pilar", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      margin: const EdgeInsets.only(right: 8),
                      child: Text("Encarnación", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 10.0,),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.primaryColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.redColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.primaryColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.redColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.primaryColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.redColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.primaryColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white),
                        padding: const EdgeInsets.all(20),
                        margin: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Juan Perez",
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: MyTheme.gray2Text,
                                  fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  "San Juan Bautista",
                                  style: TextStyle(
                                      fontSize: 12.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "Mesa 1",
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      color: MyTheme.gray3Text,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(backgroundColor: MyTheme.redColor, radius: 10,),
                    ],
                    alignment: Alignment(0.9,-1.2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
