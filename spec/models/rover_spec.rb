#encoding: utf-8
require 'rails_helper'

RSpec.describe Rover, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let (:initial_pos) { '1 2 N' }
  let (:commands) { 'LMLMLMLMM' }

  before :each do
    @rover = Rover.new initial_pos, commands
  end

  context '#initialize' do
    it 'initializes @rover' do
      expect(@rover).to_not be_nil
    end

    it 'set the @rover attributes' do
      expect(@rover.initial_pos).to eq '1 2 N'
      expect(@rover.commands).to eq 'LMLMLMLMM'
    end
  end

  context '#validate_data' do
    it 'return msg_error if initial_pos is blank' do
      initial_pos2 = nil
      rover = Rover.new(initial_pos2, 'LLM')
      expect(rover.msg_error).to eq '* A posição e os comandos não podem ser nulos!'
    end
    it 'return msg_error if commands is blank' do
      commands2 = nil
      rover = Rover.new(initial_pos, commands2)
      expect(rover.msg_error).to eq '* A posição e os comandos não podem ser nulos!'
    end
    it 'return msg_error if initial_pos is not valid' do
      initial_pos2 = '1 2'
      rover = Rover.new(initial_pos2, 'LLM')
      expect(rover.msg_error).to eq '* Posição atual do robô não é válida!'
    end
  end

  context '#move' do
    it 'Return the coordinate after the commands' do
      plan = Plan.new '5 5'
      expect(@rover.move(plan)).to eq '1 3 N'
    end
  end

  context '#define_position' do
    it 'define the position initial' do
      x_pos, y_pos, direction = @rover.define_position(initial_pos)
      expect(x_pos).to eq 1
      expect(y_pos).to eq 2
      expect(direction).to eq 'N'
    end
  end

end
