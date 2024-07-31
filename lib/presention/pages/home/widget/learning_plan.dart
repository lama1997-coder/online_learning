part of 'widget_import.dart';

class LearningPlan extends StatelessWidget {
  final HomeData homeData;
  const LearningPlan({super.key, required this.homeData});

  @override
  Widget build(BuildContext context) {
    var data = homeData.learningPlan;
    return Padding(
padding: const EdgeInsets.only(left: 16),      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DefaultText(
            title: 'Learning Plan',
            color: ThemeDataProvider.backgroundDarkColor,
            size: 18,
            fontWeight: FontWeight.w500,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomCard(
            boxShadow: const [
                BoxShadow(
                  color: Color(0x33B8B8D2), // Color with 20% opacity
                  offset: Offset(0, 8), // X and Y offset
                  blurRadius: 12, // Blur radius
                  spreadRadius: -4, // Spread radius
                ),
              ],
            child: SizedBox(
              height: 120,
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const GradientBorderCircularProgressIndicator(
                        strokeWidth: 10.0, // Border width
                        size: 46.0, // Size of the circular progress indicator
                        colors: [Color(0xFFFF4D00), Colors.white],
                        value: 0.6,
                      ),
                      title: DefaultText(
                        title: data[index].name,
                        color: ThemeDataProvider.backgroundDarkColor,
                        size: 14,
                      ),
                      trailing: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text: data[index].complate,
                              style: const TextStyle(
                                color: ThemeDataProvider.darkBlueText,
                                fontSize: 14,
                              ),
                              children: [
                                TextSpan(
                                    text: '/ ${data[index].total}',
                                    style: const TextStyle(
                                        color: ThemeDataProvider.greyLightColor,
                                        fontSize: 14)),
                              ] /*defining default style is optional */
                              )),
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                  itemCount: data.length),
            ),
          )
        ],
      ),
    );
  }
}
