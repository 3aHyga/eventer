#!/usr/bin/ruby

module Eventer
  class EventerError < StandardError
  end

  def method_missing(sym, *args, &block)
    if sym.to_s =~ /^on_(.*)/
      (event, prc) = [ $1.to_sym, block ]
      raise EventerError.new "Unregistered event :#{event}" unless self.class.events.include? event
      @__events__ = {} unless @__events__
      @__events__[event] = [] unless @__events__[event]
      @__events__[event] << prc unless @__events__[event].include? prc
    else; super; end
  end

  def event(event, *args)
    res = {}

    if @__events__ and @__events__[event]
      @__events__[event].each do |event_h|
	res[event_h] = event_h.call(args)
      end
    else
      raise EventerError.new "Unregistered event :#{event}"
    end

    res
  end

end


class Class

  def events(*args)
    return @__events__ if args.empty?
    return if @__events__

    @__events__ = args.map do |event| event.to_sym end.compact
    include Eventer
  end

end

