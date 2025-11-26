import "package:curious_bear/widgets/navigation.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "../widgets/custom_app_bar.dart";
import "package:audioplayers/audioplayers.dart";



class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  AudioPlayer musicPlayer = AudioPlayer();
  AudioPlayer sfxPlayer = AudioPlayer();

  double musicVolume = 0.5;
  double sfxVolume = 0.5;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      bottomNavigationBar: AppNavigationBar(),
      backgroundColor: Color(0xffFFF2D9),
      
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Image.asset(
              'assets/images/honeycomb.png',
              width: 400,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
             "Sound effects",
             style: TextStyle(
              color: Color(0xff3A2A1E),
              fontSize: 36,
              fontWeight: FontWeight.normal,
              fontFamily: 'Itim'
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                  "assets/icons/music.svg",
                  ),
                ),
                
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xff3A2A1E),
                      inactiveTrackColor: Color(0xffBD9577),
                      thumbColor: Color(0xff3A2A1E),
                      overlayColor: Color(0x333A2A1E),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                      trackHeight: 5,
                    ),
                    child: Slider(
                    value: musicVolume,
                    onChanged: (value){
                      setState((){
                        musicVolume = value;
                      });
                      musicPlayer.setVolume(value);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                SizedBox(
                  width: 35,
                  height: 35,
                  child: SvgPicture.asset(
                    "assets/icons/sound.svg",
                  ),
                ),

                
                Expanded(
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Color(0xff3A2A1E),
                      inactiveTrackColor: Color(0xffBD9577),
                      thumbColor: Color(0xff3A2A1E),
                      overlayColor: Color(0x333A2A1E),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10),
                      trackHeight: 5,
                    ),
                    child: Slider(
                      value: sfxVolume,
                      onChanged: (value){
                        setState((){
                          sfxVolume = value;
                        });
                        sfxPlayer.setVolume(value);
                      },
                    ),
                  )
                  
                  )
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}