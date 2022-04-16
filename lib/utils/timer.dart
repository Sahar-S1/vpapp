import 'dart:async';

Timer makePeriodicTimer({
  required Duration duration,
  required void Function(Timer timer) callback,
  bool fireNow = false,
}) {
  var timer = Timer.periodic(duration, callback);
  if (fireNow) {
    callback(timer);
  }
  return timer;
}
