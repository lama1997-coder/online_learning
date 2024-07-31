part of 'widget_import.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({
    super.key,
    required this.homeData,
  });

  final HomeData homeData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: ListView.separated(
          padding: const EdgeInsets.only(left: 16),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeData.courseOverview.length,
          separatorBuilder: (BuildContext context, int index) => const SizedBox(
                width: 10,
              ),
          itemBuilder: (context, index) {
            return CustomCard(
                width: MediaQuery.of(context).size.width * 0.7,
                color: homeData.courseOverview[index].color,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultText(
                            title: homeData.courseOverview[index].title! ,
                            color: ThemeDataProvider.backgroundDarkColor,
                            fontWeight: FontWeight.w600,
                            size: 16,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultButton(
                            onTap: () {},
                            title: 'Get Started',
                            width: 10,
                            backgroundColor: ThemeDataProvider.orangeColor,
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: SvgPicture.asset(
                          homeData.courseOverview[index].image!),
                    )
                  ],
                ));
          }),
    );
  }
}
