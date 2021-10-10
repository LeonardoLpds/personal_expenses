import 'dart:math';

import 'package:flutter/material.dart';
import 'package:personal_expenses/widgets/default_gradient.dart';
import 'package:personal_expenses/widgets/subtitle_text.dart';
import 'package:personal_expenses/widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController controller = ScrollController();
  bool closeTop = false;

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeTop = controller.offset > 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double topHeight = size.height * 0.35;
    // Screen Container
    return Container(
      decoration: BoxDecoration(
        gradient: DefaultGradient.linear(context),
      ),
      height: size.height,
      child: Column(
        children: [
          // Top Container
          Container(
            width: size.width,
            height:
                closeTop ? max(80, topHeight - controller.offset) : topHeight,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SubtitleText("Outubro"),
                  SizedBox(height: 30),
                  TitleText("R\$ 5.650,00"),
                ],
              ),
            ),
          ),

          // Bottom container
          Expanded(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // Barra de orçamento planejado
                Container(
                  padding: const EdgeInsets.only(top: 40, left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey.shade50,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(35),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                "Objetivo do mês",
                                style: Theme.of(context).textTheme.subtitle2,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "R\$ 8,000",
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ],
                          ),
                          Text(
                            "65%",
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.end,
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            height: 4,
                            width: size.width - 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context).primaryColor,
                                  blurRadius: 10,
                                  offset: const Offset(0, 5),
                                  spreadRadius: -1.4,
                                )
                              ],
                              gradient: DefaultGradient.radial(context),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(50),
                              ),
                            ),
                            height: 10,
                            width: (size.width - 60) * 0.65,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Lançamentos
                Container(
                  margin: const EdgeInsets.only(top: 130),
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: DefaultTabController(
                          length: 2,
                          child: Scaffold(
                            backgroundColor: Colors.transparent,
                            appBar: PreferredSize(
                              preferredSize: const Size.fromHeight(20),
                              child: AppBar(
                                flexibleSpace: Column(
                                  children: const [
                                    TabBar(
                                      unselectedLabelColor: Colors.blueGrey,
                                      indicatorColor: Colors.black,
                                      indicatorSize: TabBarIndicatorSize.label,
                                      tabs: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 5,
                                            top: 15,
                                          ),
                                          child: Text("Gastos"),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                            bottom: 5,
                                            top: 15,
                                          ),
                                          child: Text("Recebimentos"),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                              ),
                            ),
                            body: TabBarView(children: [
                              ListView.builder(
                                controller: controller,
                                itemCount: 10,
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (context, index) => const SizedBox(
                                  height: 100,
                                  child: Card(
                                    child: ListTile(
                                      leading: Icon(
                                        Icons.attach_money,
                                      ),
                                      title: Text("R\$ 300,00"),
                                      subtitle: Text("Lojas americanas"),
                                    ),
                                  ),
                                ),
                              ),
                              const Center(
                                child: Text("Recebimentos"),
                              )
                            ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
