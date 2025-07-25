import 'package:flutter/material.dart';

import '../model/page_configuration.dart';

class MyRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      return HomePageConfiguration();
    }

    return UnknownPageConfiguration();
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    return switch (configuration) {
      HomePageConfiguration() => const RouteInformation(location: "/"),
      UnknownPageConfiguration() => const RouteInformation(
        location: "/unknown",
      ),
    };
  }
}
