import 'models.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository instance = UserRepository._privateConstructor();

  Future<List<User>> getNotifi({required int x}) {
    return Future.delayed(const Duration(microseconds: 2000), () {
      if (x == -22) {
        return Future.error("Cannot get data from Server");
      }

      return Future.value([
        User(
            name: "Black Pink 1",
            url:
                'https://kenh14cdn.com/203336854389633024/2022/7/31/4279556447-16592316478491950406700.jpg',
            title: "The day 1",
            music: 'music.mp3'),
        User(
            name: "Black Pink 2",
            url:
                'https://bazaarvietnam.vn/wp-content/uploads/2022/08/blackpink-comeback-2022.jpg',
            title: "The day 2",
            music: 'music.mp3'),
        User(
            name: "Black Pink 3",
            url:
                "https://bazaarvietnam.vn/wp-content/uploads/2020/06/blackpink-bieu-dien-tai-coachella-2019.jpg",
            title: "The day 3",
            music: 'music.mp3'),
        User(
            name: "Black Pink 4",
            url: "https://pbs.twimg.com/media/FakJAxTaQAAy3vK.jpg",
            title: "The day 4",
            music: 'music.mp3'),
      ]);
    });
  }
}
