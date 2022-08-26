
import 'package:ex2/const/consts.dart';
import 'package:ex2/screens/myscreen/model/models.dart';
import 'package:flutter/material.dart';
class FormUserJson extends StatelessWidget {
  FormUserJson({
    Key? key,
    required this.userJson,
  }) : super(key: key);
  final UserJson userJson;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 13),
      child: InkWell(
          onTap: () {},
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
                                style: const TextStyle(
                                    color: Colors.black26, fontSize: 11)),
                            TextSpan(
                                text: '${userJson.songCount} Song',
                                style: const TextStyle(
                                    color: Colors.black26, fontSize: 11)),
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
                color: Colors.grey.withOpacity(0.5),
              )
            ],
          )),
    );
  }
}