import 'package:flutter/material.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class VolumeConfig extends StatefulWidget {
  @override
  State<VolumeConfig> createState() => _VolumeConfigState();
}

class _VolumeConfigState extends State<VolumeConfig> {
  double currentvol = 0.5;

  @override
  void initState() {
    PerfectVolumeControl.hideUI =
        false; //set if system UI is hided or not on volume up/down
    Future.delayed(Duration.zero, () async {
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
    return Container(
        padding: const EdgeInsets.only(left: 25,right: 25,bottom: 10,top: 10),
        child: Row(
          children: [
           const Icon(
             Icons.arrow_back,
             size: 16,
             color: Colors.black12,
           ),
           Expanded(
                child: Slider(
                  activeColor: Colors.black12,
                  value: currentvol,
                  onChanged: (newvol) {
                    currentvol = newvol;
                    PerfectVolumeControl.setVolume(newvol); //set new volume
                    setState(() {});
                  },
                  min: 0,
                  max: 1,
                  divisions: 100,
                ),
              ),
            const Icon(
              Icons.tv,
              size: 16,
              color: Colors.black12,
            )
          ],
        ));
  }
}
