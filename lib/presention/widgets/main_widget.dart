part of 'widget_import.dart';

class MainWidget extends StatelessWidget {
  //final Widget child;
  final PreferredSizeWidget? appBar;
  const MainWidget({super.key, this.appBar});

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const Home(),
      Container(),
      Container(),
      Container(),
      Container(),
    ];
    return SafeArea(
      child: BlocBuilder<PaginationCupit, int>(
        builder: (context, state) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton.large(
              backgroundColor: ThemeDataProvider.textLightThemeColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.only(top: 10),
                //color: Colors.red,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        //     width: double.infinity, // Make the child take full width
                        alignment: Alignment.center, // Center the child content

                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeDataProvider.floatButtonColor),
                        child: const Icon(
                          Icons.search,
                          color: ThemeDataProvider.mainAppColor,
                        ),
                      ),
                    ),
                    // SizedBox(height: 20,),
                    DefaultText(
                      title: 'Search',
                      color: ThemeDataProvider.unselectedColor,
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(40),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xB8B8D280),
                    offset: Offset(0, 2),
                    blurRadius: 15.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: state,
                  onTap: (index) =>
                      context.read<PaginationCupit>().updateIndex(index),
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(Images.activeHome),
                      icon: SvgPicture.asset(Images.home),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(Images.cource),
                      activeIcon: SvgPicture.asset(Images.activeCource),
                      label: 'Cource',
                    ),
                    BottomNavigationBarItem(
                      icon: Container(),
                      activeIcon: SvgPicture.asset(Images.activeCource),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(Images.message),
                      activeIcon: SvgPicture.asset(Images.activeMessage),
                      label: 'Message',
                    ),
                    BottomNavigationBarItem(
                      icon: SvgPicture.asset(Images.account),
                      activeIcon: SvgPicture.asset(Images.activeAccount),
                      label: 'Message',
                    ),
                  ],
                ),
              ),
            ),
            // backgroundColor: ThemeDataProvider.mainAppColor,
            body: screens[state],
          );
        },
      ),
    );
  }
}
