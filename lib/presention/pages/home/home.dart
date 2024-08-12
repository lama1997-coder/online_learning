part of 'home_import.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    bool _pinned = true;
    bool _snap = false;
    bool _floating = false;
    HomeData homeData = HomeData();
    return 
    Scaffold(
      //   appBar: const HomeAppbar(),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<LearningPlanBloc>().add(LearningPlanReloadChange());
          }
        },
        child: NestedScrollView(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              // const SliverAppBar(
              //   expandedHeight: 105.0,
              //   floating: false,
              //   backgroundColor: ThemeDataProvider.mainAppColor,
              //   titleSpacing: 0,
              //   elevation: 0,
              //   pinned: true,
              //   flexibleSpace: FlexibleSpaceBar(
              //       titlePadding: EdgeInsets.all(0),
              //       //  title: HomeTileBar(),
              //       background: HomeTileBar()),
              // ),
            ];
          },
          body: CustomScrollView(
            clipBehavior: Clip.antiAlias,
            slivers: <Widget>[
              // SliverAppBar(
              //     pinned: _pinned,
              //     leading: Container(),
              //     backgroundColor: Colors.transparent,
              //     snap: _snap,
              //     floating: _floating,
              //     elevation: 0,
              //     expandedHeight: 200.0,
              //     flexibleSpace: FlexibleSpaceBar(
              //       titlePadding: EdgeInsets.all(0),
              //       //  title: HomeTileBar(),
              //       background: HomeAppbar(),
              //     )),
              //  SliverToBoxAdapter(
              //   child:   SizedBox(
              //         height: 10,
              //         child: Column(
              //           children: [
              //             Container(color: Colors.transparent,),
              //           ],
              //         ),
              //       ),
              // ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HomeAppbar(),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    OverviewWidget(homeData: homeData),
                    SizedBox(
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
        ),
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
    Scaffold(
      appBar: HomeAppbar(),
      body: ListView(children: [
                 //   HomeAppbar(),
                    SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 23,
                    ),
                    OverviewWidget(homeData: homeData),
                    SizedBox(
                      height: 23,
                    ),
                    LearningPlan(
                      homeData: homeData,
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    const Meetup(),
                       const SizedBox(
                      height: 23,
                    ),
                    const Meetup(),
                       const SizedBox(
                      height: 23,
                    ),
                    const Meetup()
                  ],),
    );

  }
}
