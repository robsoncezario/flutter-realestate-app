import 'package:app/models/Category/model.dart';
import 'package:app/widgets/Category/card.dart';
import 'package:app/widgets/Swipable/swipable.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import './home.i18n.dart';
import './queries.dart' as query;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin<HomeScreen> {
  final GlobalKey<NavigatorState> navigationKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return new WillPopScope(
      child: new Navigator(
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) => new MaterialPageRoute(
          builder: (BuildContext _) => new Container(
            width: width * 0.6,
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: new EdgeInsets.only(
                left: width * 0.05,
                right: width * 0.05,
              ),

              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    'Discover'.i18n,
                    style: Theme.of(context).textTheme.headline1
                  ),

                  new Text(
                    'Find your dream place here'.i18n,
                    style: Theme.of(context).textTheme.subtitle2
                  ),

                  new Padding(
                    padding: new EdgeInsets.only(
                      top: height * 0.01,
                    ),

                    child: new Text(
                      'Categories'.i18n,
                      style: Theme.of(context).textTheme.subtitle1
                    ),
                  ),

                  new Padding(
                    padding: new EdgeInsets.only(
                      top: height * 0.01,
                    ),

                    child: new Query(
                      options: new QueryOptions(
                        documentNode: gql(query.displayCategories), 
                      ),

                      builder: (QueryResult result, { VoidCallback refetch, FetchMore fetchMore }) {
                        if(result.hasException) {
                          return Text(result.exception.toString(),
                            style: new TextStyle(
                              color: Theme.of(context).buttonColor
                            ));
                        }

                        if(result.loading) {
                          return new Center(
                            child: new CircularProgressIndicator()
                          );
                        }

                        var data = result.data.data['categories'];

                        List<Widget> buildCategories() => data
                          .map<Widget>((category) =>
                            new Padding(
                              padding: const EdgeInsets.only(
                                left: 5
                              ),

                              child: new CategoryCard(
                                category: Category.fromMap(category),
                              ),
                            )
                          ).toList();
                        
                        return new Swipable(
                          children: buildCategories()
                        );
                      },
                    )
                  ),
                ],
              ),
            )
        )
      ),
      onWillPop: () {
        if(navigationKey.currentState.canPop()) {
          navigationKey.currentState.pop();
          return Future<bool>.value(false);
        }

        return Future<bool>.value(true);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
