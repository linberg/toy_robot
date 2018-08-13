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
      it 'reports current position of robot if on table' do
        computer.execute('PLACE 2,4,SOUTH')
        expect(computer.execute('REPORT')).to eq '2,4,SOUTH'
      end

      it 'does not REPORT if PLACE not executed' do
        expect(computer.execute('REPORT')).to eq nil
      end
    end

    describe 'MOVE' do
      it 'moves robot one square in the direction it is facing if on table' do
        computer.execute('PLACE 3,3,WEST')
        computer.execute('MOVE')
        expect(computer.execute('REPORT')).to eq '2,3,WEST'
      end

      it 'does not MOVE robot if PLACE not executed' do
        expect(computer.execute('MOVE')).to eq nil
      end
    end

    describe 'LEFT' do
      it 'moves robot left if on table' do
        computer.execute('PLACE 4,2,SOUTH')
        computer.execute('LEFT')
        expect(computer.execute('REPORT')).to eq '4,2,EAST'
      end

      it 'does not move robot left if PLACE not executed' do
        expect(computer.execute('LEFT')).to eq nil
      end
    end

    describe 'RIGHT' do
      it 'moves robot right if on table' do
        computer.execute('PLACE 3,4,WEST')
        computer.execute('RIGHT')
        expect(computer.execute('REPORT')).to eq '3,4,NORTH'
      end

      it 'does not move robot right if PLACE not executed' do
        expect(computer.execute('RIGHT')).to eq nil
      end
    end

  end
end
