import 'package:curious_bear/widgets/custom_app_bar.dart';
import 'package:curious_bear/widgets/navigation.dart';
import 'package:flutter/material.dart';

class MemoryPage extends StatelessWidget{
  const MemoryPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context, "Memory"),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: Color(0xffFFF2D9),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(12, (index) {
          return Center(
            child: Text(
              "Item $index",
              style: TextStyle(fontSize: 36, color: Colors.black, fontFamily: 'Itim'),
            ),
          );
        }),
      ),
    );
  }
}