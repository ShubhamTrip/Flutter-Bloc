abstract class TimerEvent{}

class TimerStarted extends TimerEvent{}

class TimerReset extends TimerEvent{}

class TimerPaused extends TimerEvent{}

class TimerResumed extends TimerEvent{}