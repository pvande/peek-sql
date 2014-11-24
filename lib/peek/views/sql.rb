require 'peek/views/view'

module Peek
  module Views
    class SQL < View
      def results
        {
          duration: "%0.01fms" % duration,
          queries: queries_by_time,
        }
      end

      def duration
        events.flat_map { |_,v| v.map(&:duration) }.sum
      end

      def queries_by_time
        times = events.map { |k,v| [k, v.map(&:duration).sum] }.to_h
        keys_by_time = times.sort_by(&:last).reverse.to_h.keys

        keys_by_time.map do |k|
          queries = events[k].map do |e|
            sql = e.payload[:sql].gsub(/^ +/, '').split.join(' ')
            [ "%0.02fms" % e.duration, sql, e.payload[:binds] ]
          end

          [ k, "%0.02fms" % times[k], queries ]
        end
      end

      private

      def events
        @events
      end

      def setup_subscribers
        before_request do
          @events = Hash.new { |h,k| h[k] = [] }
        end

        subscribe 'sql.active_record' do |*args|
          event = ActiveSupport::Notifications::Event.new(*args)
          events[event.payload[:name]] << event if events
        end

        subscribe 'sql.peek' do |*args|
          event = ActiveSupport::Notifications::Event.new(*args)
          events[event.payload[:name]] << event if events
        end
      end
    end
  end
end
