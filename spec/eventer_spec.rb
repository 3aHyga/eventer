#!/usr/bin/ruby

require File.expand_path('../spec_helper', __FILE__)

describe 'Eventer' do
  it "Good event match" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    o = t.event_rs :event

    raise "Event result isn't matched" if o != [ "Matched" ]
  end

  it "Unknown event triggered" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    o = begin
      t.event_rs :unknown
    rescue Eventer::UnknownEventError
      true
    end

    raise "Event result isn't matched" if (not o) or (o != true)
  end

  it "Try to register an unknown event" do
    class Test
      events :event
    end

    t = Test.new

    o = begin
      t.on_unknown do |args|
        "Matched"
      end
      false
    rescue NoMethodError
      true
    end

    raise "Event result isn't matched" if (not o) or (o != true)
  end

  it "Purge all event handlers" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    t.purge_handlers

    o = t.event_rs :event

    raise "Event result isn't matched" if o != [ ]
  end

  it "Purge the specific event handlers" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    t.purge_handlers :event

    o = t.event_rs :event

    raise "Event result isn't matched" if o != [ ]
  end

  it "Purge all events" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    t.purge_events

    o = begin
      t.event_rs :event
    rescue Eventer::UnknownEventError
      true
    end

    raise "Event result isn't matched" if (not o) or (o != true)
  end

  it "Purge the specific event" do
    class Test
      events :event
    end

    t = Test.new

    t.on_event do |args|
      "Matched"
    end

    t.purge_events :event

    o = begin
      t.event_rs :event
    rescue Eventer::UnknownEventError
      true
    end

    raise "Event result isn't matched" if (not o) or (o != true)
  end

  it "Handler isn't defined" do
    class Test
      events :event
    end

    t = Test.new

    o = t.event_rs :event

    raise "Event result isn't matched" if o != [ ]
  end
end
