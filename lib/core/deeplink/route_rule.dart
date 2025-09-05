class RouteRule {
  final bool Function(Uri uri) matcher;
  final void Function(Uri uri) handler;

  RouteRule(this.matcher, this.handler);
}
