import 'package:flutter/material.dart';
import '../authentications/authentications.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  _SplashScreen createState() => _SplashScreen();
}

class _SplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "WELCOME TO MY APP",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
            Text(
              "MOCO NEWS",
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const Flexible(
              child: Image(
                image: AssetImage('assets/images/main/news.png'),
                width: double.infinity,
              ),
            ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: Text(
                  "Start",
                  style: Theme.of(context)
                      .textTheme
                      .button!
                      .copyWith(color: Colors.white),
                ),
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
