import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/model/project_model.dart';
import 'package:my_portfolio/widget/social.dart';

class ShowCase extends StatelessWidget {
  final double responsivePrimarySizeFactor;
  final double viewportWidth;
  final double horizontalPadding;
  // final PageController _pageController =
  // PageController(keepPage: false, viewportFraction: 0.8);

  ShowCase(
      {required this.responsivePrimarySizeFactor,
      required this.viewportWidth,
      required this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsivePrimarySizeFactor * 225,
      child: FutureBuilder(
          future: projectService.getProjects(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProjectModel> projectModels =
                  snapshot.data as List<ProjectModel>;
              return ListView.builder(
                shrinkWrap: true,
                // pageSnapping: true,
                scrollDirection: Axis.horizontal,
                itemCount: projectModels.length,
                itemBuilder: (context, position) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    width: responsivePrimarySizeFactor * 220,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              projectModels[position].name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.apply(
                                      fontSizeDelta: 5.0,
                                      fontWeightDelta: 1,
                                      fontFamily: "BalsamiqSans"),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projectModels[position].description,
                                  style: Theme.of(context).textTheme.subtitle1,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: viewportWidth * 0.001),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Divider(
                                          thickness: viewportWidth * 0.001,
                                          color: Theme.of(context).accentColor,
                                        ),
                                      ),
                                      SocialButton(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        name: 'Github',
                                        url: projectModels[position].gitLink,
                                        icon: FontAwesomeIcons.github,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
