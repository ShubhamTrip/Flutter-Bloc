
import 'dart:developer';

abstract class CounterEvent{
}

class CounterIncreamentEvent extends CounterEvent{
}

class CounterDecreamentEvent extends CounterEvent{}