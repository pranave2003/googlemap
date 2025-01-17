import 'package:flutter/material.dart';

class Paralexscrolling extends StatefulWidget {
  const Paralexscrolling({super.key});

  @override
  State<Paralexscrolling> createState() => _ParalexscrollingState();
}

class _ParalexscrollingState extends State<Paralexscrolling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: <Widget>[
      SliverAppBar(
        expandedHeight: 400.0,
        floating: false,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: const Text('Paralex Scrolling'),
          background: Image.network(
            'https://cdn.wccftech.com/wp-content/uploads/2016/09/spacee-scaled.jpg',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              color: index.isOdd ? Colors.white : Colors.black12,
              height: 100.0,
              child: Center(
                child: Text('Item $index'),
              ),
            );
          },
          childCount: 20,
        ),
      ),
    ]));
  }
}
