import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:curious_bear/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/flutter_flip_card.dart';

class MemoryPage extends StatefulWidget{
  const MemoryPage({super.key});

  @override
  State<MemoryPage> createState() => _MemoryPageState();
}

class _MemoryPageState extends State<MemoryPage>{
  final List<FlipCardController> controllers = List.generate(12, (_) => FlipCardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Memory"),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: Color(0xffFFF2D9),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: List.generate(12, (index) {
          return Center(
            child: SizedBox(
              height: 110,
              width: 110,
              child: FlipCard(
                controller: controllers[index],
                rotateSide: RotateSide.bottom,
                onTapFlipping: true, //When enabled, the card will flip automatically when touched.
                axis: FlipAxis.vertical,
                frontWidget: Image.asset(
                  'assets/images/card_front.png',
                  fit: BoxFit.fitHeight),
                backWidget: Image.asset(
                  'assets/images/badge.png',
                  fit: BoxFit.fitHeight)
                ),
              )
            );
          }),
        ),
      ),
    );
  }
}
