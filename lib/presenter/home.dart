import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:vote_observers/presenter/my_theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MIC",
          style: TextStyle(color: MyTheme.gray2Text),
        ),
        actions: [
          PopupMenuButton(
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              itemBuilder: (context) => const [
                    PopupMenuItem(
                      child: ListTile(
                        leading: Icon(Icons.people, color: Colors.black,),
                        title: Text("Operadores", style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),),
                      ),
                      value: 1,
                    ),
                  ]),
          /* IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
              ))*/
        ],
        elevation: 0,
        backgroundColor: MyTheme.background,
      ),
      backgroundColor: MyTheme.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Votantes",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '400 ',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '/15000',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    )),
                              ],
                            ),
                          ),
                          const Text(
                            "General",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray2Text,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                            width: 135,
                            animation: true,
                            lineHeight: 16.0,
                            padding: EdgeInsets.zero,
                            animationDuration: 2000,
                            percent: 0.03,
                            center: const Text(
                              "2.7%",
                              style: TextStyle(fontSize: 12),
                            ),
                            barRadius: const Radius.circular(5),
                            progressColor: MyTheme.primaryColor,
                            backgroundColor: const Color(0xFFC4C4C4),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: '400 ',
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '/8000',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    )),
                              ],
                            ),
                          ),
                          const Text(
                            "Asignados",
                            style: TextStyle(
                                fontSize: 12.0,
                                color: MyTheme.gray2Text,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                            width: 135,
                            animation: true,
                            lineHeight: 16.0,
                            padding: EdgeInsets.zero,
                            animationDuration: 2000,
                            percent: 0.09,
                            center: const Text(
                              "4.1%",
                              style: TextStyle(fontSize: 12),
                            ),
                            barRadius: const Radius.circular(5),
                            progressColor: MyTheme.primaryColor,
                            backgroundColor: const Color(0xFFC4C4C4),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        "Ver detalles",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Mesas",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.w600)),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Con el menor porcentaje de votos asignados registrados. ",
                    style: TextStyle(color: MyTheme.gray2Text, fontSize: 14.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(9, (index) {
                      return Center(
                        child: Text(
                          'Mesa $index',
                          style: TextStyle(fontSize: 14.0),
                        ),
                      );
                    }),
                    childAspectRatio: 3,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: const Text(
                        "Ver detalles",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(20, 20, 0, 20),
                      ),
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
