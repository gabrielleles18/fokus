    import 'dart:async';

    import 'package:flutter/material.dart';

    class TimerViewModel extends ChangeNotifier {
      bool isPlaying = false;
      Timer? timer;
      Duration duration = Duration.zero;

      void startTimer(int initialMinutes, ValueNotifier<bool> isPaused) {
        duration = Duration.zero;
        isPlaying = true;
        notifyListeners();

        timer = Timer.periodic(Duration(seconds: 1), (timer) {
          if (isPaused.value) return;

          if (duration.inMinutes < initialMinutes) {
            duration += Duration(seconds: 1);
            notifyListeners();
          } else {
            stopTime();
          }
        });
      }

      void stopTime() {
        isPlaying = false;
        notifyListeners();
        timer?.cancel();
      }
    }
