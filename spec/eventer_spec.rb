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

      o = (t.event :event).to_a.flatten.map do |x| x.class == String ? x : nil end.compact

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
	(t.event :unknown).to_a.flatten.map do |x| x.class == String ? x : nil end.compact
      rescue Eventer::EventerError
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
      rescue Eventer::EventerError
	true
      end

      raise "Event result isn't matched" if (not o) or (o != true)
    end
end


