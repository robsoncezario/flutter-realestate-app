import 'package:app/theme/ripple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:app/models/Category/model.dart';

class CategoryHeader implements SliverPersistentHeaderDelegate {
  final Category category;
  final double minExtent;
  final double maxExtent;

  const CategoryHeader({@required this.minExtent,
                        @required this.maxExtent,
                        this.category});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double width = MediaQuery.of(context).size.width;

    return new Hero(
      tag: this.category.name,
      child: new Image.asset(
        this.category.photo.src,
        width: width,
        fit: BoxFit.fill,
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration => null;
}

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({Key key,
                        this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    final bool useMobileLayout = shortestSide < 600;
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    void _navigateBack() => Navigator.pop(context);

    _buildMobileLayout() => new Scaffold(
      body: new CustomScrollView(
        slivers: [
          new SliverAppBar(
            automaticallyImplyLeading: true,
            backgroundColor: Theme.of(context).appBarTheme.color,
            titleSpacing: 0.00,
            leading: new MaterialButton( 
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onPressed: _navigateBack,
              minWidth: 0,
              elevation: 0.0,
              padding: const EdgeInsets.all(10),
              color: Theme.of(context).buttonColor,
              shape: new CircleBorder(),
              child: new Icon(
                RippleIcons.leftChevron,
                size: 10,
                color: Theme.of(context).iconTheme.color,
              )
            ),
            elevation: 0.0,
            snap: true,
            floating: true,
          ),

          new SliverPersistentHeader(
            pinned: false,
            floating: true,
            delegate: new CategoryHeader(
              category: this.category,
              minExtent: 150.0,
              maxExtent: 250.0,
            )
          )
        ]
      )
    );
  
    _buildTabletLayout() => new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Hero(
              tag: this.category.name,
              child: new Image.asset(
                this.category.photo.src,
                width: width * 0.6,
                fit: BoxFit.fill,
              ),
            ),          
          ],
        )
      )
    );

    return _buildTabletLayout();
  }
}