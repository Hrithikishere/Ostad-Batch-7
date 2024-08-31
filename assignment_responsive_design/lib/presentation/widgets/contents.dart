import 'package:assignment_responsive_design/presentation/widgets/buttons/join_course_button_mobile.dart';
import 'package:assignment_responsive_design/presentation/widgets/buttons/join_course_button_others.dart';
import 'package:assignment_responsive_design/presentation/widgets/responsive_builder.dart';
import 'package:flutter/material.dart';

class Contents extends StatelessWidget {
  const Contents({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _othersContents(),
      tablet: _othersContents(),
      desktop: _desktopContents(),
    );
  }
}

Widget _othersContents() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'FLUTTER WEB.\nTHE BASICS.',
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 34, fontWeight: FontWeight.bold, height: 1.1),
        ),
        const SizedBox(height: 20),
        const SizedBox(
          width: 320,
          child: Text(
            'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout. Deploying, Font Changes, Hover functionality, Modals and more.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
        const SizedBox(height: 100),
        InkWell(
          onTap: () {},
          child: const ResponsiveBuilder(
            mobile: JoinCourseButtonMobile(),
            tablet: JoinCourseButtonOthers(),
            desktop: JoinCourseButtonOthers(),
          ),
        ),
      ],
    ),
  );
}

Widget _desktopContents() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FLUTTER WEB.\nTHE BASICS.',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 34, fontWeight: FontWeight.bold, height: 1.1),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 320,
            child: Text(
              'In this course we will go over the basics of using Flutter Web for development. Topics will include Responsive Layout. Deploying, Font Changes, Hover functionality, Modals and more.',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
      const SizedBox(width: 400),
      InkWell(
        onTap: () {},
        child: const JoinCourseButtonOthers(),
      ),
    ],
  );
}
