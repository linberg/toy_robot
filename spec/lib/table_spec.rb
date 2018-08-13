require 'spec_helper'

describe Table do
  let(:table) { Table.new }

  describe '#new' do
    it 'create an instance of Table' do
      expect(table).to be_a Table
    end
  end

  describe '#place' do
    it 'allows robot to be placed' do
      expect(table.place(0, 0)).to be_truthy
    end
  end

  describe '#valid_position' do
    it 'has valid position' do
      expect(table.place(2,4)).to be_truthy
    end

    it 'has invalid position' do
      expect(table.place(6,9)).to be_falsey
    end
  end

  describe '#has_a_robot' do
    it 'is on table with correct coordinates' do
      table.place(2,3)
      expect(table.has_a_robot?).to be_truthy
    end

    it 'is not on table with out of bounds coordinates' do
      table.place(-1,6)
      expect(table.has_a_robot?).to be_falsey
    end
  end
end
