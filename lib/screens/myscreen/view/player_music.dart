import 'package:audioplayers/audioplayers.dart';
import 'package:ex2/screens/myscreen/model/models.dart';
import 'package:ex2/screens/myscreen/view/volume_config.dart';
import 'package:flutter/material.dart';

class PlayerMusic extends StatefulWidget {
  User user;

  PlayerMusic({Key? key, required this.user}) : super(key: key);

  @override
  State<PlayerMusic> createState() => _HomePageState(user1: user);
}

class _HomePageState extends State<PlayerMusic> {
  _HomePageState({required this.user1});

  IconData playBtn = Icons.pause;
  bool playing = true;
  double value = 0;
  final player = AudioPlayer();
  var duration;
  late User user1;

  void initPlayer() async {
    await player.setSource(AssetSource(user1.music));
    duration = await player.getDuration();
    await player.resume();
    player.onPositionChanged.listen(
      (Duration d) {
        setState(() {
          value = d.inSeconds.toDouble();
        });
      },
    );
  }

  //init the player
  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
          activeColor: Colors.black12,
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
           "${duration.inMinutes} : ${duration.inSeconds.remainder(60)}",
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      //setting the player controller
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            user1.title,
            style: const TextStyle(color: Colors.black, fontSize: 20),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            user1.name,
            style: const TextStyle(color: Colors.black26, fontSize: 12),
          ),
        ],
      ),
      Container(
        margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.favorite_border,
              color: Colors.black26,
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
            const Icon(
              Icons.list,
              color: Colors.black26,
              size: 28,
            ),
          ],
        ),
      ),
      const Expanded(child: SizedBox()),
      VolumeConfig(),
      Container(
        margin: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.ios_share,
              color: Colors.black12,
              size: 20,
            ),
            Container(
              padding: const EdgeInsets.all(2),
              color: Colors.black12,
              child: const Icon(
                Icons.share_outlined,
                color: Colors.black,
                size: 20,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              color: Colors.black12,
              child: const Icon(
                Icons.loop,
                color: Colors.black,
                size: 20,
              ),
            ),
            const Icon(
              Icons.more_horiz_rounded,
              color: Colors.black,
              size: 20,
            ),
          ],
        ),
      ),
    ]);
  }
}
