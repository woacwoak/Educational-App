import 'package:curious_bear/pages/games.dart';
import 'package:curious_bear/pages/math.dart';
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
  
  int? firstIndex;
  int? secondIndex;
  bool wait = false;
  List<bool> matched = List.filled(12, false);

  late List<String> cardImages;

  @override
  void initState() {
    super.initState();
    _generateCards();
  }

  void resetGame() {
  setState(() {
    // Reset match tracking
    matched = List.filled(12, false);
    firstIndex = null;
    secondIndex = null;
    wait = false;

    // Regenerate and reshuffle cards
    _generateCards();

    // Flip all cards back to front
    for (var controller in controllers) {
      if (controller.state?.isFront == false) {
        controller.flipcard();
      }
    }
  });

  Navigator.pop(context); // Close dialog
}

  void _generateCards() {
    List<String> fruits = [
      "assets/images/blackberry.png",
      "assets/images/blueberry.png",
      "assets/images/cherries.png",
      "assets/images/grape.png",
      "assets/images/raspberry.png",
      "assets/images/strawberry.png",
    ];

    cardImages = [...fruits, ...fruits];

    cardImages.shuffle();
  }
  void _handleCardTap(int index) async {
    if(wait) return;
    if(matched[index]) return;
    if(firstIndex == index) return;

    controllers[index].flipcard();

    if(firstIndex == null) {
      firstIndex = index;
      return;
    }

    

      secondIndex = index;
      wait = true;

      await Future.delayed(const Duration(milliseconds: 700));

      if(cardImages[firstIndex!] == cardImages[secondIndex!]){
        matched[firstIndex!] = true;
        matched[secondIndex!] = true;
      }else{
        await controllers[firstIndex!].flipcard();
        await controllers[secondIndex!].flipcard();
      }

      firstIndex = null;
      secondIndex = null;
      wait = false;

      if(matched.every((m) => m)){
        _showWinDialog();
      }
    }
  void _showWinDialog() {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("🎉 You Win!"),
        content: Text("All pairs matched!"),
        actions: [
          TextButton(
            onPressed: resetGame,
            child: const Text("🔄 Restart"),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GamePage()),
              );
            },
            child: Text("Play other games"),
          ),
          
        ],
      );
    },
  );

}


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
              child: GestureDetector(
                onTap: () => _handleCardTap(index),
                child: FlipCard(
                  controller: controllers[index],
                  rotateSide: RotateSide.bottom,
                  onTapFlipping: false,
                  axis: FlipAxis.vertical,
                  frontWidget: Image.asset(
                    'assets/images/card_front.png',
                    fit: BoxFit.fitHeight
                    ),
                  backWidget: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      cardImages[index],
                      fit: BoxFit.fitHeight
                    ),
                  ),
                ),
              )
              
              ),
            );
          }),
        ),
      ),
    );
  }
}