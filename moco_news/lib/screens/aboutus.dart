import 'package:flutter/material.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
              automaticallyImplyLeading: displayMobileLayout,
              iconTheme: IconThemeData(color: Theme.of(context).buttonColor),
              title: const Text(
                ScreenTitles.about,
              ),
            ),
            drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: Column(
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.only(top: 12),
                  child: const Text(
                      "   Moco News adalah sebuah aplikasi berita yang memberikan pengguna akses cepat dan mudah untuk mendapatkan informasi terkini dari berbagai sumber berita terpercaya. Dengan antarmuka yang intuitif dan responsif, Moco News memastikan pengguna dapat mengikuti berita terbaru dengan mudah dan menyenangkan.",
                      style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
