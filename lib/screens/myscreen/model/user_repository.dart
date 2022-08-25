

import 'models.dart';

class UserRepository {
  UserRepository._privateConstructor();

  static final UserRepository instance = UserRepository
      ._privateConstructor();

  Future<List<User>> getNotifi({required int x}) {
    return Future.delayed(const Duration(microseconds: 2000), (){
      if(x ==-22){
        return Future.error("Cannot get data from Server");
      }

      return Future.value([
        User(
            name: "Luffy",
            url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Le%C3%AFko_au_bois_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois_de_la_Cambre.jpg',
            title: "Bai hat 1"),
        User(
            name: "Zoro",
            url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Le%C3%AFko_au_bois_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois_de_la_Cambre.jpg',
            title: "Bai hat 2"),
        User(
            name: "Nami",
            url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Le%C3%AFko_au_bois_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois_de_la_Cambre.jpg',
            title: "Bai hat 3"),
        User(
            name: "Boa Hancock",
            url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/Le%C3%AFko_au_bois_de_la_Cambre.jpg/220px-Le%C3%AFko_au_bois_de_la_Cambre.jpg',
            title: "Bai hat 4"),
      ]);
    }
    );
  }
}