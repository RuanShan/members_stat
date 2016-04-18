FactoryGirl.define do
  factory :customer do
    name "MyString"
    id_num "MyString"
    cellphone "MyString"

    factory :customer_in_bouns_stage do
      transient do
        bonus_sales_count 5
      end

      after(:create) do |customer, evaluator|
        create_list(:sale_status_bonus, evaluator.bonus_sales_count, customer: customer)
      end
    end

    factory :customer_in_pending_stage do
      transient do
        pending_sales_count 5
      end

      after(:create) do |customer, evaluator|
        create_list(:sale_status_pending, evaluator.pending_sales_count, customer: customer)
      end
    end

  end


end
