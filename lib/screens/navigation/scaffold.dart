import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app/screens/models/screen.dart';
import 'package:app/widgets/Logo/logo.dart';
import 'package:app/theme/ripple.dart';
import 'package:app/screens/navigation/bloc.dart';

import './scaffold.i18n.dart';

class AdaptiveScaffold extends StatelessWidget {
  @override
  Widget build(context) {
    final double shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    final double width = MediaQuery.of(context).size.width;
    final padding = width * 0.025;

    Screen.collection[2].notifications++;

    void handleTap(int index) {
      Provider.of<NavigationBloc>(
        context, 
        listen: false
      ).index = index;
    }

    List<NavigationRailDestination> _buildDestinations() => Screen
      .collection
      .map((screen) =>
        new NavigationRailDestination(
          label: new Text(screen.title.i18n),
          icon: new Stack(
            children: [
              new Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                  left: 5
                ),
                child: new Icon(
                  screen.icon,
                  size: 22,
                ),
              ),

              if(screen.hasNotifications) 
                new Positioned.fill(
                  child: new Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      width: 6,
                      height: 6,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                    )
                  )
                )
            ]
          ),

          selectedIcon: new Stack(
            children: [
              new Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                  left: 5
                ),
                child: new Icon(
                  screen.activeIcon,
                  size: 22,
                ),
              ),

              if(screen.hasNotifications) 
                new Positioned.fill(
                  child: new Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      width: 6,
                      height: 6,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                    )
                  )
                )
            ]
          )
        )
      ).toList();
    
    Widget _buildLayout() {
      if(!useMobileLayout) {
        return new Container(
          padding: new EdgeInsets.only(
            left: padding,
            right: padding
          ),
          child: new Row(
            children: <Widget>[
              new Consumer<NavigationBloc>(
                builder: (context, navBloc, child) {
                  return new NavigationRail(
                    selectedIndex: navBloc.index,
                    onDestinationSelected: handleTap,
                    destinations: _buildDestinations(),
                  );
                }
              ),

              new Padding(
                padding: new EdgeInsets.only(
                  left: padding
                ),
              ),

              const VerticalDivider(
                thickness: 1, 
                width: 1
              ),

              new Expanded(
                child: new Selector<NavigationBloc, int>(
                  selector: (_, bloc) => bloc.index,
                  builder: (_, index, child) {
                    return Screen.collection.elementAt(index).widget;
                  }
                )
              )
            ],
          )
        );
      }

      return new Selector<NavigationBloc, int>(
        selector: (_, bloc) => bloc.index,
        builder: (_, index, child) {
          return Screen.collection.elementAt(index).widget;
        }
      );
    }

    List<BottomNavigationBarItem> _buildTabs() => Screen
      .collection
      .map((screen) =>
        new BottomNavigationBarItem(
          title: new Text(screen.title.i18n),
          icon: new Stack(
            children: [
              new Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                  left: 5
                ),
                child: new Icon(
                  screen.icon,
                  size: 22,
                ),
              ),

              if(screen.hasNotifications) 
                new Positioned.fill(
                  child: new Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      width: 6,
                      height: 6,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                    )
                  )
                )
            ]
          ),

          activeIcon: new Stack(
            children: [
              new Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  right: 5,
                  left: 5
                ),
                child: new Icon(
                  screen.activeIcon,
                  size: 22,
                ),
              ),

              if(screen.hasNotifications) 
                new Positioned.fill(
                  child: new Align(
                    alignment: Alignment.topRight,
                    child: new Container(
                      width: 6,
                      height: 6,
                      decoration: new BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).primaryColor
                      ),
                    )
                  )
                )
            ]
          )
        )
      ).toList();

    List<Widget> _buildActionButtons() => [
      new Padding(
        padding: new EdgeInsets.only(
          left: 5
        ),
        child: new Tooltip(
          message: 'Search'.i18n,
          child: new MaterialButton( 
            onPressed: () => null,
            minWidth: 0,
            elevation: 0.0,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).buttonColor,
            shape: new CircleBorder(),
            child: new Icon(
              RippleIcons.searchOutline,
              size: 16,
              color: Theme.of(context).iconTheme.color,
            )
          ),
        ),
      ),

      new Padding(
        padding: new EdgeInsets.only(
          left: 5
        ),
        child: new Tooltip(
          message: 'Settings'.i18n,
          child: new MaterialButton( 
            onPressed: () => null,
            minWidth: 0,
            elevation: 0.0,
            padding: EdgeInsets.all(10),
            color: Theme.of(context).buttonColor,
            shape: new CircleBorder(),
            child: new Icon(
              RippleIcons.user,
              size: 16,
              color: Theme.of(context).iconTheme.color,
            )
          ),
        ),
      ),

      new Padding(
        padding: new EdgeInsets.only(
          left: padding
        ),
      )
    ];

    return new Scaffold(
      body: new NestedScrollView(
        headerSliverBuilder: (context, bool innerBoxIsScrolled) {
          return <Widget>[
            new SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Theme.of(context).appBarTheme.color,
              titleSpacing: 0.0,
              title: new Padding(
                padding: new EdgeInsets.only(
                  left: padding
                ),

                child: new Logo(
                  color: Theme.of(context).iconTheme.color,
                  fontSize: 16,
                ),
              ),
              elevation: 0.0,
              snap: true,
              floating: true,
              //forceElevated: innerBoxIsScrolled,
              actions: _buildActionButtons()
            )
          ];
        },

        body: new MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: _buildLayout()
        ),
      ),

      bottomNavigationBar: useMobileLayout ? new Consumer<NavigationBloc>(
        builder: (context, navBloc, child) {
          return new BottomNavigationBar(
            items: _buildTabs(),
            currentIndex: navBloc.index,
            onTap: handleTap,
            unselectedItemColor: Theme.of(context).iconTheme.color,
          );
        }
      ) : null,
    );
  }
}
