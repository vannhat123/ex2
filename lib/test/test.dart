import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    // TODO: implement initState
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
              activeColor: Colors.redAccent,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${(value / 60).floor()}: ${(value % 60).floor()}",
                style: const TextStyle(color: Colors.white),
              ),
              Expanded(child: SizedBox()),
              const Text(
                "Thoi gian",
                //    "${duration?.inMinutes} : ${duration!.inSeconds % 60}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          //setting the player controller
          const SizedBox(
            height: 60.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          )
        ]);
  }
}
