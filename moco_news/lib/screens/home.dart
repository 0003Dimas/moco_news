import 'package:flutter/material.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _newsSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (BuildContext context, Widget? widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NewsScreen(news: breaking_news[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: breaking_news[index].imageUrl!,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(breaking_news[index].imageUrl!),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Breaking news text details
            Positioned(
              left: 28.0,
              bottom: 28.0,
              child: SizedBox(
                width: 250.0,
                child: Text(
                  breaking_news[index].title!.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

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
              backgroundColor: Theme.of(context).backgroundColor,
              iconTheme: IconThemeData(color: Theme.of(context).buttonColor),
              elevation: 0.0,
              title: Text(
                "MOCO NEWS",
              ),
              //title: const Image(
              //image: AssetImage('assets/images/main/moco_logo.png'),
              //),
            ),
            drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: ListView(
              children: <Widget>[
                //Top slider starts from here
                SizedBox(
                  height: 280.0,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: breaking_news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _newsSelector(index);
                    },
                  ),
                ),
                //News category starts from here
                NewsCategories(),
                const SizedBox(height: 20.0),
                //Content scrall starts from here
                ContentScroll(
                  imageUrl: trending_pic,
                  title: 'Trending',
                  imageHeight: 250.0,
                  imageWidth: 150.0,
                ),
                const SizedBox(height: 10.0),
                ContentScroll(
                  imageUrl: recent_pic,
                  title: 'Recent',
                  imageHeight: 250.0,
                  imageWidth: 150.0,
                ),
                const SizedBox(height: 10.0),
                ContentScroll(
                  imageUrl: tech_pic,
                  title: 'Teknologi',
                  imageHeight: 250.0,
                  imageWidth: 150.0,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
