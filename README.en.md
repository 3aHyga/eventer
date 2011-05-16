# Eventer

Eventer is simple engine to control custom class events.

## Usage

### Creation, and setup a handler

Make a class, and set the allowable events for it. Then create a class instance, and set handler to process an event as a block using 'on_...' method of the class instance, where instead ... put the name of the event. For an each of events, thou canst setup an unlimited number of handlers.

    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

### Triggering the handlers

In order to the event triggers, call 'event' method, that enumerates and calls all settled handlers. The 'event' method will return an Array, with a Hash values. The Hash will contain the pair as seen as the Proc pointer, and a result value.

    t.event :event, args... # -> [{<#Proc...> => "Matched"}, ...]

Also, there is the procedure allowing to output the simple result value as an Array with values from each handler.

    t.event_rs :event, args... # -> ["Matched", ...]

# Copyright

Copyright (c) 2011 Malo Skrylevo
See LICENSE for details.

