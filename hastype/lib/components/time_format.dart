class TimeFormat{
    formatTimer(int seconds, int minutes, int hours) {
    String secondsFormated = "${seconds}s",
        minutesFormated = "${minutes}min",
        hoursFormated = "${hours}h";

    if (seconds == 0) {
      secondsFormated = "";
    }
    if (minutes == 0) {
      minutesFormated = "";
    }
    if (hours == 0) {
      hoursFormated = "";
    }

    return "$hoursFormated$minutesFormated$secondsFormated";
  }
}