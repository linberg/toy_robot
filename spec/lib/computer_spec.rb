require 'spec_helper'

describe 'computer' do
  let(:robot) { double 'robot' }
  let(:computer) { Computer.new }
  let(:table) { double 'table' }

  describe '#new' do
    it 'creates an instance of computer' do
      expect(computer).to be_a Computer
    end

    it 'has a table' do
      expect(computer.table).to be_a Table
    end

    it 'has a robot' do
      expect(computer.robot).to be_a Robot
    end
  end

  describe '#execute' do
    describe 'PLACE' do
      it 'places the robot at coordinates if valid' do
        expect(computer.execute('0,0,NORTH')).to eq nil
      end
    end

    describe 'REPORT' do
      it 'reports current position of robot' do
        computer.execute('PLACE 2,4,SOUTH')
        expect(computer.execute('REPORT')).to eq '2,4,SOUTH'
      end
    end

    describe 'MOVE' do
      it 'moves robot one square in the direction it is facing' do
        computer.execute('PLACE 3,3,WEST')
        computer.execute('MOVE')
        expect(computer.execute('REPORT')).to eq '2,3,WEST'
      end
    end
  end
end
