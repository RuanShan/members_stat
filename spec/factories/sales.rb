FactoryGirl.define do
  factory :sale do
    unit 1
    price 890

    factory :sale_status_bonus do
      buy_at DateTime.current.ago(7)
    end

    factory :sale_status_pending do
      buy_at DateTime.current
    end

    factory :sale_status_kickout do
      buy_at DateTime.current.ago( 10.years)
    end

  end

end
