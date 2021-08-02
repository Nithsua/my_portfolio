import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/model/project_model.dart';
import 'package:my_portfolio/widget/social.dart';

class ShowCase extends StatelessWidget {
  final double responsiveTextSize;
  final double viewportWidth;
  final double horizontalPadding;

  ShowCase(
      {this.responsiveTextSize, this.viewportWidth, this.horizontalPadding});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsiveTextSize * 225,
      child: FutureBuilder(
          future: projectService.getProjects(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<ProjectModel> projectModels = snapshot.data;
              return ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: projectModels.length,
                itemBuilder: (context, position) {
                  return Container(
                    padding: const EdgeInsets.all(10.0),
                    width: responsiveTextSize * 220,
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
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16 * responsiveTextSize,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projectModels[position].description,
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 10 * responsiveTextSize,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: viewportWidth * 0.001),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: responsiveTextSize * 212 -
                                            responsiveTextSize * 150,
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
