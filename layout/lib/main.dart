import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//------------------matirial App สามารถยัด Scaffold ได้----------------

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Layout Training',
      home: Scaffold(
          appBar: AppBar(
              title: const Text(
            'layout training',
          )),
          body: const Center(
            child: ReviewCard(),
          )),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 30, 30, 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://cdn.pixabay.com/photo/2016/06/20/23/50/mixed-berries-1470226_1280.jpg'),
          rating,
          iconList
        ],
      ),
    );
  }
}

final rating = Container(
  padding: const EdgeInsets.all(20),
  child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
    Row(
      children: [
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        Icon(Icons.star, color: Colors.green[500]),
        const Icon(Icons.star, color: Colors.black),
        const Icon(Icons.star, color: Colors.black),
      ],
    ),
    const Text(
      '170 Reviews',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w800,
        fontFamily: 'Roboto',
        fontSize: 20,
      ),
    )
  ]),
);

final iconList = Container(
  padding: const EdgeInsets.all(20),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(
        children: [
          Icon(Icons.kitchen, color: Colors.green[500]),
          const Text('PREP:'),
          const Text('25 min'),
        ],
      ),
      Column(
        children: [
          Icon(Icons.timer, color: Colors.green[500]),
          const Text('COOK:'),
          const Text('1 hr'),
        ],
      ),
      Column(
        children: [
          Icon(Icons.restaurant, color: Colors.green[500]),
          const Text('FEEDS:'),
          const Text('4-6'),
        ],
      ),
    ],
  ),
);
