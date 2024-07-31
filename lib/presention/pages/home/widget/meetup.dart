part of 'widget_import.dart';

class Meetup extends StatelessWidget {
  const Meetup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: CustomCard(
        color: ThemeDataProvider.primaryDarkCardThemeColor,
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(vertical: 3),
          //  isThreeLine: true,
          title: DefaultText(
            title: "Meetup",
            color: ThemeDataProvider.primaryDarkCardEndThemeColor,
            fontWeight: FontWeight.bold,
            size: 24,
          ),
          subtitle: DefaultText(
            title: 'Off-line exchange of learning experiences',
            color: ThemeDataProvider.primaryDarkCardEndThemeColor,
          ),
          trailing: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(Images.meet)),
        ),
      ),
    );
  }
}
