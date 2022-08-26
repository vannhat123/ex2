import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class Home extends  StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double currentvol = 0.5;

  @override
  void initState() {
    PerfectVolumeControl.hideUI = false; //set if system UI is hided or not on volume up/down
    Future.delayed(Duration.zero,() async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        //refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top:100),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text("Current Volumen: $currentvol"),
                Slider(
                  value: currentvol,
                  onChanged: (newvol){
                    currentvol = newvol;
                    PerfectVolumeControl.setVolume(newvol); //set new volume
                    setState(() {
                    });
                  },
                  min: 0, //
                  max:  1,
                  divisions: 100,
                )
              ],
            )
        )

    );
  }
}