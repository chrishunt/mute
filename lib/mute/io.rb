require 'stringio'

module Mute
  # Mutes and captures stdout and stderr IO streams
  class IO
    [:stdout, :stderr].each do |stream|
      define_singleton_method("capture_#{stream}") do |&block|
        capture stream, block
      end
    end

    private

    def self.capture(stream, block)
      captured = StringIO.new
      original = eval("$#{stream}")
      eval "$#{stream} = captured"

      block.call if block

      captured.string
    ensure
      eval "$#{stream} = original" if block
    end
  end
end
