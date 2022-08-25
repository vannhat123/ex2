import 'package:audioplayers/audioplayers.dart';
import 'package:ex2/const/color.dart';
import 'package:flutter/material.dart';

class PlayerMusic extends StatefulWidget {
  const PlayerMusic({Key? key}) : super(key: key);

  @override
  State<PlayerMusic> createState() => _HomePageState();
}

class _HomePageState extends State<PlayerMusic> {
  IconData playBtn = Icons.play_arrow;
  bool playing = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  //init the player
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Slider.adaptive(
          onChangeEnd: (new_value) async {
            setState(() {
              value = new_value;
            });
            await player.seek(Duration(seconds: new_value.toInt()));
          },
          min: 0.0,
          value: value,
          max: 214.0,
          onChanged: (value) {},
          activeColor: MyColors.SUB_COLOR2,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(left: 12, right: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${(value / 60).floor()}: ${(value % 60).floor()}",
              style: const TextStyle(color: Colors.black),
            ),
            const Expanded(child: SizedBox()),
             Text(
              "${duration?.inMinutes}",
              //    "${duration?.inMinutes} : ${duration!.inSeconds % 60}",
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
      //setting the player controller
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("The day",style: TextStyle(color: Colors.black,fontSize: 20),),
          Text("Adele", style: TextStyle(color:MyColors.SUB_COLOR2,fontSize: 12),),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(left: 12, right: 12,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              color: MyColors.SUB_COLOR2,
              size: 25,
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTapDown: (details) {
                player.setPlaybackRate(0.5);
              },
              onTapUp: (details) {
                player.setPlaybackRate(1);
              },
              child: const Center(
                child: Icon(
                  Icons.fast_rewind_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                await player.resume();
                if (!playing) {
                  setState(() {
                    player.onPositionChanged.listen(
                      (Duration d) {
                        setState(() {
                          value = d.inSeconds.toDouble();
                        });
                      },
                    );
                    playBtn = Icons.pause;
                    playing = true;
                  });
                } else {
                  player.pause();
                  setState(() {
                    playBtn = Icons.play_arrow;
                    playing = false;
                  });
                }
              },
              child: Center(
                child: Icon(
                  playBtn,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
            InkWell(
              onTapDown: (details) {
                player.setPlaybackRate(2);
              },
              onTapUp: (details) {
                player.setPlaybackRate(1);
              },
              child: const Center(
                child: Icon(
                  Icons.fast_forward_rounded,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            const Expanded(child: SizedBox()),
            Icon(
              Icons.list,
              color: MyColors.SUB_COLOR2,
              size: 28,
            ),
          ],
        ),
      ),
      const Expanded(child: SizedBox()),
      Container(
        margin: const EdgeInsets.only(left: 12, right: 12,bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.ios_share,
              color: MyColors.SUB_COLOR2,
              size: 28,
            ),
            Icon(
              Icons.share_outlined,
              color: MyColors.SUB_COLOR2,
              size: 28,
            ),
            Icon(
              Icons.loop,
              color: MyColors.SUB_COLOR2,
              size: 28,
            ),
            Icon(
              Icons.more_horiz_rounded,
              color: MyColors.SUB_COLOR2,
              size: 28,
            ),
          ],
        ),
      ),
    ]);
  }
}
