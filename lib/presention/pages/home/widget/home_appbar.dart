part of 'widget_import.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, 300),
      child: Stack(
        children: <Widget>[
          Container(
            height: 150,
            padding: const EdgeInsets.all(20),
            color: ThemeDataProvider.mainAppColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DefaultText(
                        title: "Hi, Kristin",
                        fontWeight: FontWeight.w600,
                        size: 24,
                      ),
                      DefaultText(title: 'Let’s start learning')
                    ],
                  ),
                ),
                ClipOval(
                  child: Image.asset(
                    Images.profile,
                    width: 50,
                  ),
                )
              ],
            ),
          ),

          Container(), // Required some widget in between to float AppBar

          Positioned(
            // To take AppBar Size only
            top: 100.0,
            left: 20.0,
            right: 20.0,
            child: Container(
              padding: const EdgeInsets.all(16),
              height: 105,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x33B8B8D2), // Color with 20% opacity
                    offset: Offset(0, 8), // X and Y offset
                    blurRadius: 12, // Blur radius
                    spreadRadius: -4, // Spread radius
                  ),
                ],
                color: Colors.white,
              ),
              // primary: false,B8B8D233
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DefaultText(
                              title: "Learned today",
                              size: 12,
                              color: ThemeDataProvider.greyLightColor,
                            ),
                           const SizedBox(height: 10,),
                            RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text: '46min',
                                    style: TextStyle(
                                        color: ThemeDataProvider.darkBlueText,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                    children: [
                                      TextSpan(
                                          text: '/ 60min',
                                          style: TextStyle(
                                              color: ThemeDataProvider.greyLightColor,fontSize: 10)),
                                    ] /*defining default style is optional */
                                    )),
                          ],
                        ),
                      ),
                      DefaultText(title: "My courses",color: ThemeDataProvider.mainAppColor,)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Progress()
                ],
              ),
            
            ),
          )
        ],
      ),
    );

  }

  @override
    Size get preferredSize => const Size.fromHeight(240);
}
