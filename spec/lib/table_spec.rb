require 'spec_helper'

describe Table do
  let(:table) { Table.new }

  describe 'place' do
    it 'allows robot to be placed' do
      expect(table.place(0, 0)).to be_truthy
    end
  end

  describe 'valid_position' do
    it 'has valid position' do
      expect(table.place(2,4)).to be_truthy
    end

    it 'has invalid position' do
      expect(table.place(6,9)).to be_falsey
    end
  end
end
