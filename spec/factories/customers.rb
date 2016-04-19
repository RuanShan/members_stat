FactoryGirl.define do
  factory :customer do
    name "MyString"
    id_num "MyString"
    cellphone "MyString"
    transient do
      sales_count 0
    end

    factory :customer_in_bouns_stage do
      after(:create) do |customer, evaluator|
        create_list(:sale_status_bonus, evaluator.sales_count, customer: customer)
      end
    end

    factory :customer_in_pending_stage do
      after(:create) do |customer, evaluator|
        create_list(:sale_status_pending, evaluator.sales_count, customer: customer)
      end
    end

    factory :customer_in_kickout_stage do
      after(:create) do |customer, evaluator|
        create_list(:sale_status_kickout, evaluator.sales_count, customer: customer)
      end
    end

  end


end
