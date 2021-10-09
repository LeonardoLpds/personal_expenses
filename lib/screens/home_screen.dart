import 'dart:math';

import 'package:flutter/material.dart';

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
    final double topHeight = size.height * 0.40;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColorLight,
          ],
        ),
      ),
      height: size.height,
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 10),
            width: size.width,
            height:
                closeTop ? max(0, topHeight - controller.offset) : topHeight,
            alignment: Alignment.center,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Outubro",
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "R\$ 3.120,76",
                    style: Theme.of(context)
                        .textTheme
                        .headline2!
                        .copyWith(color: Colors.white),
                  ),
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        height: 5,
                        width: size.width,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50),
                          ),
                        ),
                        margin: const EdgeInsets.all(15),
                        height: 20,
                        width: size.width * 0.68,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 0),
              padding: const EdgeInsets.only(left: 15, top: 5, right: 15),
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(color: Colors.black45, blurRadius: 10)
                ],
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                      closeTop ? max(0, 35 - controller.offset) : 35),
                ),
                color: Colors.white,
              ),
              child: ListView.builder(
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
            ),
          ),
        ],
      ),
    );
  }
}
