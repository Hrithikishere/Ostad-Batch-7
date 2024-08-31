import 'package:assignment_responsive_design/presentation/widgets/appbar/appbar_with_buttons.dart';
import 'package:assignment_responsive_design/presentation/widgets/contents.dart';
import 'package:assignment_responsive_design/presentation/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ResponsiveBuilder(
          mobile: _mobileLayout(),
          tablet: _tabletLayout(),
          desktop: _desktopLayout(),
        ),
      ),
    );
  }
}

Widget _mobileLayout() {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      backgroundColor: Colors.white,
      title: const Align(
        alignment: Alignment.centerRight,
        child: Text(
          'HUMMING\nBIRD.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    ),
    drawer: Drawer(
      child: ListView(
        children: <Widget>[
          Container(
            height: 200,
            color: const Color(0xFF23e796),
            child: const DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'SKILL UP NOW',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
                  ),
                  Text(
                    'TAP HERE',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 45, top: 30),
            child: ListTile(
              leading: Icon(Icons.local_movies_outlined),
              title: Text('Episodes'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 45, top: 30),
            child: ListTile(
              leading: Icon(Icons.sms_failed),
              title: Text('About'),
            ),
          ),
        ],
      ),
    ),
    body: const Contents(),
  );
}

Widget _tabletLayout() {
  return const Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: AppbarWithButtons(),
        ),
        Center(child: Contents()),
        SizedBox(),
      ],
    ),
  );
}

Widget _desktopLayout() {
  return const Scaffold(
    backgroundColor: Colors.white,
    body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.all(40.0),
          child: AppbarWithButtons(),
        ),
        Contents(),
        SizedBox(),
      ],
    ),
  );
}
