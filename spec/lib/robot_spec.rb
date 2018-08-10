require 'spec_helper'

describe 'Robot' do

  let(:robot) { Robot.new }

  describe '#orient' do
    it 'allows orientation to the north' do
      expect(robot.orient(:north)).not_to be_nil
    end

    it 'allows orientation to the east' do
      expect(robot.orient(:east)).not_to be_nil
    end
    
    it 'allows orientation to the south' do
      expect(robot.orient(:south)).not_to be_nil
    end

    it 'allows orientation to the west' do
      expect(robot.orient(:west)).not_to be_nil
    end
  end

  describe '#coordinates' do
    context 'robot is facing north' do
      before { robot.orient(:north) }
      it 'moves up' do
        expect(robot.coordinates).to eq(x: 0, y: 1)
      end
    end

    context 'robot is facing east' do
      before { robot.orient(:east) }
      it 'moves to the right' do
        expect(robot.coordinates).to eq(x: 1, y: 0)
      end
    end

    context 'robot is facing south' do
      before { robot.orient(:south) }
      it 'moves down' do
        expect(robot.coordinates).to eq(x: 0, y: -1)
      end
    end

    context 'robot is facing west' do
      before { robot.orient(:west) }
      it 'moves to the left' do
        expect(robot.coordinates).to eq(x: -1, y: 0)
      end
    end
  end

end
