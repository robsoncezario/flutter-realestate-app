import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLBloc extends StatelessWidget {
  final Widget child;
  
  const GraphQLBloc({@required this.child}) : super();

  @override
  Widget build(BuildContext context) {
    ValueNotifier<GraphQLClient> _client = new ValueNotifier(
      new GraphQLClient(
        cache: new NormalizedInMemoryCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
        link: new HttpLink(
          uri: 'http://localhost:4000/graphql/',
        ),
      ),
    );

    return new GraphQLProvider(
      client: _client,
      child: new CacheProvider(
        child: child
      )
    );
  }
}