/*import 'package:flutter/material.dart';
import 'package:app/models/Category/model.dart';
import 'package:app/widgets/Category/screen.dart';

import 'dart:math' as Math;

class PropertyCard extends StatelessWidget {
  final Category property;

  const PropertyCard({Key key,
                      this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    final double min = Math.min(width, height);

    void _handleOnPressed() => Navigator
      .of(context)
      .push(new PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        pageBuilder: (_, animation, __) => new FadeTransition(
          opacity: animation,
          child: new CategoryScreen(
            category: this.property,
          ),
        ),
      ));

    void _handleMouseEnter(event) => print('uuuuuu');
    void _handleMouseExit(event) => print('zikk');

    return new Stack(
      children: <Widget>[
        new MouseRegion(
          onEnter: _handleMouseEnter,
          onExit: _handleMouseExit,
          child: new MaterialButton( 
            onPressed: _handleOnPressed,
            minWidth: 0,
            elevation: 0.0,
            padding: EdgeInsets.zero,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(4)
            ),
            child: new Column(
              children: <Widget>[
                new Hero(
                  tag: this.category.name,
                  child: new Image.asset(
                    this.category.imageSrc,
                    width: 0.18 * min,
                    height: 0.135 * min,
                    fit: BoxFit.fill,
                  ),
                ),

                new Padding(
                  padding: new EdgeInsets.only(
                    top: height * 0.005
                  ),

                  child: new Text(
                    this.category.plural,
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          )
        )
      ],
    );
  }
} */