require 'spec_helper'
require 'mute/io'

describe Mute::IO do
  describe '.capture_stdout' do
    it 'mutes stdout' do
      expect($stdout).to_not receive(:puts)

      described_class.capture_stdout do
        puts 'hello'
      end
    end

    it 'captures stdout' do
      output = described_class.capture_stdout do
        puts 'Hello'
        puts 'World!'
      end

      expect(output).to eq "Hello\nWorld!\n"
    end

    it 'unmutes stdout when done' do
      original = $stdout

      described_class.capture_stdout do
        puts 'hello'
      end

      expect($stdout).to eq original
    end

    it 'unmutes stdout when there is an exception' do
      original = $stdout

      expect {
        described_class.capture_stdout do
          raise StandardError.new('Oops')
        end
      }.to raise_error

      expect($stdout).to eq original
    end

    it 'captures stdout indefinitely when called without a block' do
      expect($stdout).to_not receive(:puts)

      described_class.capture_stdout

      puts 'hello'
    end
  end

  describe '.capture_stderr' do
    it 'captures stderr' do
      message = 'oops'

      output = described_class.capture_stderr do
        $stderr.puts message
      end

      expect(output).to include message
    end
  end
end
