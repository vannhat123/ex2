// import 'package:ex2/const/consts.dart';
// import 'package:ex2/screens/myscreen/view/my_screen.dart';
//
// import 'package:flutter/material.dart';
//
//
// class BottomBarScreen extends StatefulWidget {
//   static const routeName ='/bottom_bar';
//   const BottomBarScreen({Key? key}) : super(key: key);
//
//   @override
//   _BottomBarScreenState createState() => _BottomBarScreenState();
// }
//
// class _BottomBarScreenState extends State<BottomBarScreen> {
//   final List _pages = [
//     {
//       'page': const MyScreen(),
//     },
//     {
//       'page': const MyScreen(),
//     },
//     {
//       'page': const MyScreen(),
//     },
//     {
//       'page': const MyScreen(),
//     },
//     {
//       'page': const MyScreen(),
//     },
//   ];
//   int _selectedPageIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void _selectPage(int index) {
//     setState(() {
//       _selectedPageIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white12.withOpacity(0.05),
//       body: _pages[_selectedPageIndex]['page'],
//       bottomNavigationBar: BottomAppBar(
//         color: MyColors.SUB_COLOR2,
//         shape: const CircularNotchedRectangle(),
//         notchMargin: 0.01,
//         clipBehavior: Clip.antiAlias,
//         child: SizedBox(
//           height: kBottomNavigationBarHeight * 0.98,
//           child: Container(
//             decoration:  const BoxDecoration(
//
//             ),
//             child: BottomNavigationBar(
//               onTap: _selectPage,
//               backgroundColor: MyColors.PRIMARY_COLOR1,
//               unselectedItemColor:MyColors.SUB_COLOR2,
//               selectedItemColor: MyColors.SUB_COLOR1,
//               currentIndex: _selectedPageIndex,
//               selectedFontSize: 10,
//               unselectedFontSize: 10,
//               items: const [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.queue_music),
//                   label: "My Music",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.favorite_border),
//                   label: "For You",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.star_border_outlined),
//                   label: "New",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.radio),
//                   label: "Radio",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.branding_watermark),
//                   label: "Connect",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
//
//


import 'package:ex2/const/consts.dart';
import 'package:ex2/screens/myscreen/view/my_screen.dart';
import 'package:flutter/material.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({Key? key}) : super(key: key);
  static const routeName ='/bottom_bar';
  @override
  State<StatefulWidget> createState() =>_BottomBarScreenSate();


}

class _BottomBarScreenSate extends State<BottomBarScreen> {
  int selectedIndex = 0;
  final Widget _myContacts = const MyScreen();
  final Widget _myEmails = const MyScreen();
  final Widget _myProfile = const MyScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  getBody(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        backgroundColor: MyColors.PRIMARY_COLOR1,
        unselectedItemColor:MyColors.SUB_COLOR2.withOpacity(0.5),
        selectedItemColor: MyColors.SUB_COLOR1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.queue_music),
            label: "My Music",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "For You",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "New",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.radio),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.branding_watermark),
            label: "Connect",
          ),
        ],
        onTap: (int index) {
          onTapHandler(index);
        },
      ),
    );
  }
  Widget getBody( )  {
    if(selectedIndex == 0) {
      return _myContacts;
    } else if(selectedIndex==1) {
      return _myEmails;
    } else {
      return _myProfile;
    }
  }

  void onTapHandler(int index)  {
    setState(() {
      selectedIndex = index;
    });
  }
}

