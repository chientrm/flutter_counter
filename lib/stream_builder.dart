import 'package:flutter/material.dart';

import 'async_widget_builder.dart';

class CStreamBuilder<T> extends StreamBuilderBase<T, AsyncSnapshot<T>> {
  final YWAsyncWidgetBuilder<T> builder;
  final YWAsyncErrorWidgetBuilder<T>? errorBuilder;
  final Widget? loadingWidget;
  const CStreamBuilder({
    super.key,
    super.stream,
    required this.builder,
    this.errorBuilder,
    this.loadingWidget,
  });

  @override
  AsyncSnapshot<T> afterData(AsyncSnapshot<T> current, T data) {
    return AsyncSnapshot<T>.withData(ConnectionState.active, data);
  }

  @override
  AsyncSnapshot<T> afterError(
      AsyncSnapshot<T> current, Object error, StackTrace stackTrace) {
    return AsyncSnapshot<T>.withError(
        ConnectionState.active, error, stackTrace);
  }

  @override
  AsyncSnapshot<T> afterDone(AsyncSnapshot<T> current) {
    return current.inState(ConnectionState.done);
  }

  @override
  AsyncSnapshot<T> afterDisconnected(AsyncSnapshot<T> current) {
    return current.inState(ConnectionState.none);
  }

  @override
  Widget build(BuildContext context, AsyncSnapshot<T> currentSummary) {
    if (currentSummary.hasData) {
      return builder(context, currentSummary.data as T);
    }
    if (currentSummary.hasError) {
      if (errorBuilder != null) {
        return errorBuilder!(context, currentSummary.error!);
      } else {
        return throw currentSummary.error!;
      }
    }
    return loadingWidget ?? Container();
  }

  @override
  AsyncSnapshot<T> initial() {
    return AsyncSnapshot<T>.nothing();
  }
}
