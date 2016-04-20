#encoding: utf-8
require 'rails_helper'

RSpec.describe Directions, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  context '#for_degrees' do
    it 'returns the degrees given the cardinal point N' do
      expect(Directions.for_degrees('N')).to eq 0
    end
    it 'returns the degrees given the cardinal point E' do
      expect(Directions.for_degrees('E')).to eq 90
    end
    it 'returns the degrees given the cardinal point S' do
      expect(Directions.for_degrees('S')).to eq 180
    end
    it 'returns the degrees given the cardinal point W' do
      expect(Directions.for_degrees('W')).to eq 270
    end
  end

  context '#for_cardinal' do
    it 'returns the cardinal point given the degrees 0' do
      expect(Directions.for_cardinal(0)).to eq 'N'
    end
    it 'returns the cardinal point given the degrees 90' do
      expect(Directions.for_cardinal(90)).to eq 'E'
    end
    it 'returns the cardinal point given the degrees 180' do
      expect(Directions.for_cardinal(180)).to eq 'S'
    end
    it 'returns the cardinal point given the degrees 270' do
      expect(Directions.for_cardinal(270)).to eq 'W'
    end
  end
end
