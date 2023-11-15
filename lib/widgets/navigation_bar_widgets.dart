import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  NavigationBarWidget({
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onItemTapped,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Image.asset(selectedIndex == 0
                  ? 'assets/images/img_fridge_select.png'
                  : 'assets/images/img_fridge.png'
              // width: MediaWidth(context, 0.4),
              ),
          label: '냉장고',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(selectedIndex == 1
                  ? 'assets/images/img_fridge_with_open_freezer_select.png'
                  : 'assets/images/img_fridge_with_open_freezer.png'
              // width: MediaWidth(context, 0.4),
              ),
          label: '냉장고 파먹기',
        ),
        BottomNavigationBarItem(
            icon: Image.asset(selectedIndex == 2
                    ? 'assets/images/img_cooking_book_select.png'
                    : 'assets/images/img_cooking_book.png'
                // width: MediaWidth(context, 0.4),
                ),
            label: '냉장고 속 레시피'),
        BottomNavigationBarItem(
            icon: Image.asset(selectedIndex == 3
                    ? 'assets/images/img_moleskine_select.png'
                    : 'assets/images/img_moleskine.png'
                // width: MediaWidth(context, 0.4),
                ),
            label: '레시피 카테고리'),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(selectedIndex == 4
                ? 'assets/icons/ico_vector_select.svg'
                : 'assets/icons/ico_vector.svg'),
            label: '마이페이지'),
      ],
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(height: 1.8),
      selectedFontSize: 10,
      unselectedFontSize: 10,
    );
  }
}
