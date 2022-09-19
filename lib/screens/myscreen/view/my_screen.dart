import 'package:audioplayers/audioplayers.dart';
import 'package:ex2/const/consts.dart';
import 'package:ex2/screens/myscreen/model/models.dart';
import 'package:ex2/screens/myscreen/view/player_music.dart';
import 'package:ex2/screens/myscreen/view/user_list_item.dart';
import 'package:ex2/widget/loading.dart';
import 'package:flutter/material.dart';

import 'form_user_json.dart';

class MyScreen extends StatefulWidget {
  static const routeName = '/my_screen';

  const MyScreen({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  bool _isLoading = false;
  List<User> _user = [];
  String _errorMessage = '';
  late GetData getData;
  var textName = "Adele-25";
  var textTitle = "I miss you";
  late User userSend = User(name: '', url: '', title: '', music: '');

  bool playing = false;
  double value = 0;
  final player = AudioPlayer();

  bool viewVisible = false;

  void showWidget() {
    setState(() {
      viewVisible = true;
    });
  }

  void hideWidget() {
    setState(() {
      viewVisible = false;
    });
  }

  // void initPlayer(User user) async {
  //   await player.setSource(AssetSource(user.music));
  //   player.resume();
  // }

  IconData playBtn = Icons.pause;
  var duration;

  void initPlayer(User user) async {
    await player.setSource(AssetSource(user.music));
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

  @override
  void initState() {
    getData = GetData();
    super.initState();
    UserRepository.instance.getNotifi(x: 1).then((responseUser) {
      setState(() {
        _user = responseUser;
        _isLoading = false;
      });
    }).catchError((errorDetail) {
      setState(() {
        _user = [];
        _isLoading = false;
        _errorMessage = errorDetail;
      });
    }); //async
  }

  Future<void> showPlayerScreen(User user) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            color: Colors.grey.withOpacity(0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Stack(
                    children: [
                      Image.network(
                        user.url,
                        width: 500,
                        height: 700,
                        fit: BoxFit.cover,
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 25,
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: Icon(
                              Icons.arrow_drop_down_circle_rounded,
                              color: MyColors.SUB_COLOR2,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                      color: MyColors.SUB_COLOR2,
                      child: PlayerMusic(user: user)),
                )
              ],
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: MyColors.PRIMARY_COLOR1,
            body: SingleChildScrollView(
                child: Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                width: 0.3,
                                color: Colors.grey.withOpacity(0.5)),
                          ),
                          color: MyColors.SUB_COLOR2,
                        ),
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        height: 40,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.account_circle_outlined,
                              color: MyColors.SUB_COLOR1,
                              size: 28,
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 28,
                                  width: 96,
                                  decoration: BoxDecoration(
                                      color: MyColors.SUB_COLOR1,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(4),
                                          bottomLeft: Radius.circular(4))),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Library",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(
                                  height: 28,
                                  width: 96,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: MyColors.SUB_COLOR1),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(4),
                                          bottomRight: Radius.circular(4))),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Playlists",
                                    style:
                                        TextStyle(color: MyColors.SUB_COLOR1),
                                  ),
                                ),
                              ],
                            ),
                            //  const Expanded(child: SizedBox()),
                            Icon(
                              Icons.search,
                              color: MyColors.SUB_COLOR1,
                              size: 28,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 5, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shuffle All",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: MyColors.SUB_COLOR1,
                                      fontWeight: FontWeight.bold),
                                ),
                                Icon(
                                  Icons.read_more,
                                  color: MyColors.SUB_COLOR1,
                                  size: 30,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Divider(
                              height: 1, color: Colors.grey.withOpacity(0.5)),
                          Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      top: 22, bottom: 22),
                                  child: const Text(
                                    "RECENTLY ADDED >",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                ),
                                SizedBox(
                                    height: 150,
                                    child: Expanded(
                                        child: _isLoading == true
                                            ? Loading(
                                                title: 'Loading user list')
                                            : ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: _user.length,
                                                itemBuilder: (context, index) {
                                                  User user = _user[index];
                                                  return InkWell(
                                                    child: Column(
                                                      children: [
                                                        UserListItem(
                                                          user: user,
                                                          index: index,
                                                        ),
                                                      ],
                                                    ),
                                                    onTap: () {
                                                      setState(() {
                                                        playBtn = Icons.pause;
                                                        showWidget();
                                                        initPlayer(user);
                                                        textTitle = user.title;
                                                        textName = user.name;
                                                        userSend = user;
                                                      });
                                                    },
                                                  );
                                                }))),
                                Row(
                                  //  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: Divider(
                                          height: 0.5,
                                          color: Colors.grey.withOpacity(0.5)),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: Text(
                                        "Artists",
                                        style: TextStyle(
                                            color: MyColors.SUB_COLOR1,
                                            fontSize: 28),
                                      ),
                                    ),
                                    Expanded(
                                      child: Divider(
                                          height: 0.5,
                                          color: Colors.grey.withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "A",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FutureBuilder(
                            future: getData.getData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var parseData =
                                snapshot.data as List<UserJson>;
                                return ListView.builder(
                                  padding:
                                  const EdgeInsets.symmetric(
                                      vertical: 8),
                                  itemCount: parseData.length,
                                  itemBuilder:
                                      (BuildContext context,
                                      int index) {
                                    var userIndex =
                                    parseData[index];
                                    return FormUserJson(
                                      userJson: userIndex,
                                    );
                                  },
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  visible: viewVisible,
                  child: AnimatedOpacity(
                      opacity: viewVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 700),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.9,
                        child: Column(
                         children: [
                           const Expanded(child: SizedBox(),),
                           Container(
                               decoration: BoxDecoration(
                                 border: Border(
                                   top: BorderSide(
                                       width: 0.2,
                                       color: Colors.grey.withOpacity(0.5)),
                                   bottom: BorderSide(
                                       width: 0.3,
                                       color: Colors.grey.withOpacity(0.5)),
                                 ),
                                 color: MyColors.SUB_COLOR2,
                               ),
                               height: 50,
                               child: Column(children: [
                                 Expanded(
                                     child: InkWell(
                                       onTap: () {
                                         setState(() {
                                           showPlayerScreen(userSend);
                                         });
                                       },
                                       child: Container(
                                         color: const Color.fromRGBO(246, 246, 246, 1),
                                         child: Row(
                                           crossAxisAlignment:
                                           CrossAxisAlignment.center,
                                           mainAxisAlignment:
                                           MainAxisAlignment.spaceBetween,
                                           children: [
                                             IconButton(
                                               onPressed: () async {
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
                                               icon: Icon(
                                                 playBtn,
                                                 color: MyColors.SUB_COLOR1,
                                               ),
                                             ),
                                             Column(
                                               mainAxisAlignment:
                                               MainAxisAlignment.center,
                                               children: [
                                                 Text(
                                                   textTitle,
                                                   style: const TextStyle(
                                                       color: Colors.black,
                                                       fontSize: 12),
                                                 ),
                                                 Text(
                                                   textName,
                                                   style: const TextStyle(
                                                       color: Colors.black26,
                                                       fontSize: 10),
                                                 )
                                               ],
                                             ),
                                             Row(
                                               children: [
                                                 Icon(
                                                   Icons.more_horiz_rounded,
                                                   color: MyColors.SUB_COLOR1,
                                                 ),
                                                 const SizedBox(
                                                   width: 10,
                                                 )
                                               ],
                                             )
                                           ],
                                         ),
                                       ),
                                     )),
                               ])),
                         ],
                        ),
                      )),
                )
              ],
            ))));
  }
}
