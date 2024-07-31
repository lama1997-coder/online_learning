part of 'home_import.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeData homeData = HomeData();
    return Scaffold(
      appBar: const HomeAppbar(),
      body: ListView(
        shrinkWrap: true,
       // padding: EdgeInsets.only(left: 16),
        children: [
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
    );
  }
}

