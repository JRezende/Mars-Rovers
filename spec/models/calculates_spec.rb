#encoding: utf-8
require 'rails_helper'

RSpec.describe Rover, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context '#change_direction' do
    context 'change the direction as the command' do
      it 'changes direction to the right' do
        expect(Calculates.change_direction('R', 'N')).to eq 'E'
      end
      it 'changes direction to the left' do
        expect(Calculates.change_direction('L', 'N')).to eq 'W'
      end
    end
  end

  context '#move_forward' do

    before :each do
      @plan = Plan.new '5 5'
    end

    it 'move in the direction E' do
      expect(Calculates.move_forward(2, 2, @plan, 'E')).to eq [3, 2]
    end
    it 'move in the direction S' do
      expect(Calculates.move_forward(2, 2, @plan, 'S')).to eq [2, 1]
    end
    it 'move in the direction W' do
      expect(Calculates.move_forward(2, 2, @plan, 'W')).to eq [1, 2]
    end
    it 'move in the direction N' do
      expect(Calculates.move_forward(2, 2, @plan, 'N')).to eq [2, 3]
    end
  end
end
