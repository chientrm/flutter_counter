import 'package:flutter/material.dart';

typedef YWAsyncWidgetBuilder<T> = Widget Function(BuildContext context, T data);
typedef YWAsyncErrorWidgetBuilder<T> = Widget Function(
    BuildContext context, Object error);
