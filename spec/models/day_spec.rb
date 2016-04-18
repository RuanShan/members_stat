require 'rails_helper'

RSpec.describe Day, type: :model do
  let( :customer_no_sale) { create :customer }
  let( :customer_in_bouns_stage) { create :customer_in_bouns_stage }
  let( :customer_in_pending_stage) { create :customer_in_pending_stage }

  it "customer have no bonus" do
    expect( customer_no_sale.day.bonus).to eq 0
  end

  it "should be on bouns stage" do
    customer= customer_in_bouns_stage
    expect( customer.day.bonus).to be > 0
    expect( customer.day.daily_bonus).to be > 0
  end

  it "should be on pending stage" do
    expect( customer_in_bouns_stage.day.bonus).to eq 0
  end

end
