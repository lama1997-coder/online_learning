part of 'home_import.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    HomeData homeData = HomeData();
    return Scaffold(
      //   appBar: const HomeAppbar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar( 
              pinned: _pinned,
              leading: Container(),
              backgroundColor: Colors.
              white,
              snap: _snap,
              floating: _floating,
              expandedHeight: 220.0,
              flexibleSpace:FlexibleSpaceBar(background:  HomeAppbar(),)),
              
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                OverviewWidget(homeData: homeData),
                const SizedBox(
                  height: 23,
                ),
                LearningPlan(
                  homeData: homeData,
                ),
                const SizedBox(
                  height: 23,
                ),
                const Meetup()
              ],
            ),
          ),
        ],
      ),
//  ListView(
//         shrinkWrap: true,
//         // padding: EdgeInsets.only(left: 16),
//         children: [
//           OverviewWidget(homeData: homeData),
//           const SizedBox(
//             height: 23,
//           ),
//           LearningPlan(
//             homeData: homeData,
//           ),
//           const SizedBox(
//             height: 23,
//           ),
//           const Meetup()
//         ],
//       ),
    );
  }
}
