require 'spec_helper'

describe 'Robot' do

  let(:robot) { Robot.new }

  describe '#new' do
    it 'creates an instance of Robot' do
      expect(robot).to be_a Robot
    end
  end

  describe '#left' do
    context 'robot is facing north and turns left' do
      before {
        robot.orient(:north)
        robot.left
       }
      it 'will face west' do
        expect(robot.orientation).to eq(:west)
      end
    end

    context 'robot is facing west and turns south' do
      before {
        robot.orient(:west)
        robot.left
       }
      it 'will face west' do
        expect(robot.orientation).to eq(:south)
      end
    end
  end

  describe '#right' do
    context 'robot is facing west and turns right' do
      before {
        robot.orient(:west)
        robot.right
       }
      it 'will face north' do
        expect(robot.orientation).to eq(:north)
      end
    end

    context 'robot is facing north and turns right' do
      before {
        robot.orient(:north)
        robot.right
       }
      it 'will face north' do
        expect(robot.orientation).to eq(:east)
      end
    end
  end

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
