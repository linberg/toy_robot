require 'spec_helper'
require 'pry'

describe 'Command' do
  let(:command) { Command.new }

  describe '#place' do
    it 'allows robot to be placed' do
      expect(table.place(0, 0)).not_to be_nil
    end
  end
end
