import 'package:flutter/material.dart';
import 'package:vote_observers/presenter/add_operator.dart';
import 'package:vote_observers/presenter/my_theme.dart';
import 'package:vote_observers/presenter/widgets/assing_operator.dart';

class Operators extends StatelessWidget {
  const Operators({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Operadores",
            style: TextStyle(color: MyTheme.gray2Text),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            PopupMenuButton(
                itemBuilder: (context) => [
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.person_add,
                            color: Colors.black,
                          ),
                          title: const Text(
                            "Crear operador",
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddOperator()),
                          ),
                        ),
                        value: 1,
                      ),
                      PopupMenuItem(
                        child: ListTile(
                          leading: const Icon(
                            Icons.mediation,
                            color: Colors.black,
                          ),
                          title: const Text(
                            "Asignar operador",
                            style: TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w500),
                          ),
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AssignOperator()),
                          ),
                        ),
                        value: 2,
                      ),
                    ]),
          ],
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
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          const Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      padding: const EdgeInsets.fromLTRB(20, 20,20,0),
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
                          Text(
                            "0965432345",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray3Text,
                                fontWeight: FontWeight.w500),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                text: const TextSpan(
                                  text: '0 ',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '/35 asignados',
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400,
                                            color: MyTheme.gray2Text
                                        )),
                                  ],
                                ),
                              ),
                              TextButton(
                                child: const Text(
                                  "Ver asignados",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
