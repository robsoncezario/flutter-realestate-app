import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'package:app/theme/dark.dart';
import 'package:app/graphql/bloc.dart';
import 'package:app/screens/navigation/bloc.dart';
import 'package:app/screens/navigation/scaffold.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return new GraphQLBloc(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('pt', 'BR'),
        ],
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        darkTheme: dark,
        home: new I18n(
          initialLocale: const Locale('pt', 'BR'),
          child: new MultiProvider(
            providers: [
              new ChangeNotifierProvider(
                create: (_) => new NavigationBloc()
              )
            ],
            child: new AdaptiveScaffold(),
          )
        ),
      ),
    );
  }
}