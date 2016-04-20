require 'rails_helper'

RSpec.describe Plan, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let (:coord_upper) {' 5 5'}

  before :each do
    @plan = Plan.new coord_upper
  end

  it 'initializes @plan' do
    expect(@plan).to_not be_nil
  end

  it 'set the plan attributes' do
      coords = coord_upper.split(' ')
      expect(@plan.x_max.to_i).to eq coords[0].to_i
      expect(@plan.y_max.to_i).to eq coords[1].to_i
  end

end
