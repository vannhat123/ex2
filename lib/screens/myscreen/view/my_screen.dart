import 'package:audioplayers/audioplayers.dart';
import 'package:ex2/const/consts.dart';
import 'package:ex2/screens/myscreen/model/models.dart';
import 'package:ex2/screens/myscreen/view/player_music.dart';
import 'package:ex2/screens/myscreen/view/user_list_item.dart';
import 'package:flutter/material.dart';

import '../../../widget/loading.dart';

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
  var textName= "Adele-25";
  var textTitle = "I miss you";
  late User userSend = User(name: '', url: '', title: '');

  IconData playBtn = Icons.play_arrow;
  bool playing = false;
  double value = 0;
  final player = AudioPlayer();
  Duration? duration;

  void initPlayer() async {
    await player.setSource(AssetSource("music.mp3"));
    duration = await player.getDuration();
  }

  @override
  void initState() {
    initPlayer();
    getData = GetData();
    super.initState();
    UserRepository.instance.getNotifi(x: 1).then((responseUser) {
      setState(() {
        _user = responseUser;
        _isLoading = false;
      });
    }).catchError((errorDetail) {
      //Bam Camping => this code will run ? navigation lesson
      setState(() {
        _user = [];
        _isLoading = false;
        _errorMessage = errorDetail;
        //alert(context: context, title: 'Error', content: _errorMessage);
      });
    }); //async
  }

  void showPlayerScreen(User user) {
    showModalBottomSheet<void>(
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
                        'https://upload.wikimedia.org/wik'
                        'ipedia/commons/thumb/d/dd/Le%C3%AFko_au_boi'
                        's_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois'
                        '_de_la_Cambre.jpg',
                        width: 500,
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
                      color: MyColors.SUB_COLOR2.withOpacity(0.1),
                      child: PlayerMusic()),
                ),
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
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 40,
            color: MyColors.SUB_COLOR2.withOpacity(0.1),
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
                          border: Border.all(color: MyColors.SUB_COLOR1),
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4))),
                      alignment: Alignment.center,
                      child: Text(
                        "Playlists",
                        style: TextStyle(color: MyColors.SUB_COLOR1),
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
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.5)),
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
                Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.5)),
                Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 22, bottom: 22),
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
                                  ? Loading(title: 'Loading user list')
                                  : ListView.builder(
                                      scrollDirection: Axis.horizontal,
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
                                              textTitle = user.title;
                                              textName =user.name;
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
                                height: 2,
                                color: MyColors.SUB_COLOR2.withOpacity(0.5)),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5, right: 5),
                            child: Text(
                              "Artists",
                              style: TextStyle(
                                  color: MyColors.SUB_COLOR1, fontSize: 28),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                                height: 2,
                                color: MyColors.SUB_COLOR2.withOpacity(0.5)),
                          )
                        ],
                      ),
                      const Text(
                        "A",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                          height: 133,
                          child: FutureBuilder(
                            future: getData.getData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                var parseData = snapshot.data as List<UserJson>;
                                return ListView.builder(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  itemCount: parseData.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var userIndex = parseData[index];
                                    return FormUserJson(
                                      userJson: userIndex,
                                    );
                                  },
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.5)),
          Expanded(
              child: InkWell(
            onTap: () => showPlayerScreen(userSend),
            child: Container(
              color: MyColors.SUB_COLOR2.withOpacity(0.1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.play_arrow,
                    color: MyColors.SUB_COLOR1,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        textTitle,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                      Text(
                        textName,
                        style:
                            TextStyle(color: MyColors.SUB_COLOR2, fontSize: 10),
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
          Divider(height: 1, color: MyColors.SUB_COLOR2.withOpacity(0.5)),
        ],
      ),
    ));
  }
}

class FormUserJson extends StatelessWidget {
   FormUserJson({Key? key, required this.userJson,}) : super(key: key);
  final UserJson userJson;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      child: InkWell(
        onTap:(){
        },
          child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: Image.network(
                  userJson.avatar!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userJson.artistName!,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: '${userJson.albumCount} Album • ',
                            style: TextStyle(
                                color: MyColors.SUB_COLOR2, fontSize: 11)),
                        TextSpan(
                            text: '${userJson.songCount} Song',
                            style: TextStyle(
                                color: MyColors.SUB_COLOR2, fontSize: 11)),
                      ],
                    ),
                  )
                ],
              ),
              const Expanded(child: SizedBox()),
              Icon(
                Icons.more_horiz_rounded,
                color: MyColors.SUB_COLOR1,
                size: 25,
              ),
            ],
          ),
          Divider(
            thickness: 0.4,
            color: MyColors.SUB_COLOR2,
          )
        ],
      )),
    );
  }
}
