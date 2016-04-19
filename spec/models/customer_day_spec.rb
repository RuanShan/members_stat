require 'rails_helper'

RSpec.describe Day, type: :model do
  before( :all ) do  create(:effective_config_bonus_per_share, effect_value: 7.0) end
  before( :all ) do  create(:effective_config_kick_out_until, effect_value: 1900) end

  let( :customer_no_sale) { create :customer }

  it "customer have no bonus" do
    expect( customer_no_sale.day.bonus).to eq 0
  end

  context "customer with 2 pending sale " do
    let( :customer_in_bouns_stage) { create :customer_in_bouns_stage, sales_count: 2 }
    it "should be on bouns stage" do
      customer= customer_in_bouns_stage
      expect( customer.day.bonus).to be > 0
      expect( customer.day.daily_bonus).to eq 14
    end
  end

  context "customer with 2 pending sale " do
    let( :customer_in_pending_stage) { create :customer_in_pending_stage,sales_count: 2 }
    it "should be on pending stage" do
      expect( customer_in_pending_stage.day.bonus).to eq 0
    end
  end

  context "customer with 2 kickout sale " do
    let( :customer_in_kickout_stage) { create :customer_in_kickout_stage, sales_count: 2 }
    it "should have no dalily_bonus today" do
      expect( customer_in_kickout_stage.day.daily_bonus).to eq 0
    end
    
    it "should have bonus same as sales.price" do
      customer = customer_in_kickout_stage
      expect( customer.day.bonus).to eq 1900*2
    end
  end
end
