class StopwatchState {
  bool isStopWatchRunning = false;

  StopwatchState._privateConstructor();

  static final StopwatchState _instance = StopwatchState._privateConstructor();

  factory StopwatchState() {
    return _instance;
  }
}
