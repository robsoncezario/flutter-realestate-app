import 'package:app/theme/ripple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'dart:math' as Math;

import './swipable.i18n.dart';

class Swipable extends StatefulWidget {
  final List<Widget> children;

  const Swipable({Key key,
                  @required this.children}) : super(key : key);

  @override
  _SwipableState createState() => _SwipableState();
}

class _SwipableState extends State<Swipable> {
  ScrollController _controller = new ScrollController();
  GlobalKey _widgetKey = new GlobalKey();
  bool _isReady = false;
  bool _canGoBack = false;
  bool _canGoForward = false;

  void _scrollListener() {
    if(_canGoBack != canGoBack || _canGoForward != canGoForward) {
      setState(() {
        _canGoBack = canGoBack;
        _canGoForward = canGoForward;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    if(isSwipable) {
      _controller.addListener(_scrollListener);
      SchedulerBinding.instance.addPostFrameCallback((_) => setState(() => _isReady = true)); 
    }
  }

  void goBack() => _controller.animateTo(
    Math.max(0, 
      _controller.position.pixels - _widgetKey.currentContext.size.width),
    duration: new Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn);

  void goForward() => _controller.animateTo(
    _controller.position.pixels + Math.min(
      _controller.position.maxScrollExtent - _controller.position.pixels,
      _widgetKey.currentContext.size.width),
    duration: new Duration(milliseconds: 400),
    curve: Curves.fastOutSlowIn);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get canGoBack => isSwipable && _isReady && _controller.position.pixels > 0;
  bool get canGoForward => isSwipable && _isReady && _controller.position.maxScrollExtent != _controller.position.pixels;
  bool get isSwipable => kIsWeb;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return new Stack(
      children: <Widget>[
        new SingleChildScrollView(
          key: _widgetKey,
          scrollDirection: Axis.horizontal,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.children
          ),
          controller: _controller,
        ),

        new Positioned.fill(
          child: new Align(
            alignment: Alignment.centerLeft,
            child: new AnimatedCrossFade(
              crossFadeState: canGoBack ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: new Duration(milliseconds: 400),
              firstChild: new Container(
                margin: new EdgeInsets.only(
                  left: width * 0.01
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    new BoxShadow(
                      color: Theme.of(context).iconTheme.color.withOpacity(.6),
                      blurRadius: 5.0, 
                      spreadRadius: 0.0, 
                      offset: const Offset(0.0, 0.0),
                    )
                  ]
                ),
                child: new MaterialButton( 
                  onPressed: goBack,
                  minWidth: 0,
                  elevation: 0.0,
                  padding: const EdgeInsets.all(14),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  hoverColor: Theme.of(context).buttonColor,
                  shape: new CircleBorder(),
                  child: new Icon(
                    RippleIcons.leftChevron,
                    size: 10,
                    color: Theme.of(context).iconTheme.color,
                  )
                ),
              ),
              secondChild: new SizedBox.shrink()
            )
          )
        ),

        new Positioned.fill(
          child: new Align(
            alignment: Alignment.centerRight,
            child: new AnimatedCrossFade(
              crossFadeState: canGoForward ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: new Duration(milliseconds: 400),
              firstChild: new Container(
                margin: new EdgeInsets.only(
                  right: width * 0.01
                ),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    new BoxShadow(
                      color: Theme.of(context).iconTheme.color.withOpacity(.6),
                      blurRadius: 5.0, 
                      spreadRadius: 0.0, 
                      offset: const Offset(0.0, 0.0),
                    )
                  ]
                ),
                child: new MaterialButton( 
                  onPressed: goForward,
                  minWidth: 0,
                  elevation: 0.0,
                  padding: const EdgeInsets.all(14),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  hoverColor: Theme.of(context).buttonColor,
                  shape: new CircleBorder(),
                  child: new Icon(
                    RippleIcons.rightChevron,
                    size: 10,
                    color: Theme.of(context).iconTheme.color,
                  )
                ),
              ),
              secondChild: new SizedBox.shrink()
            )
          )
        ),
      ]
    );
  }
}