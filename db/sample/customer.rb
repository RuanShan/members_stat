require 'ffaker'
100.times.each{|i|
  attributes = { name: FFaker::Name.name, id_num: FFaker::Identification.ssn, cellphone:  FFaker::PhoneNumberSE.phone_number }
  customer = Customer.create!(attributes )

  [0, 1, 0, 2, 5 ].sample.times{|j|
    #unit: nil, price: nil, started_at: nil, kickout_at: nil, status
    attributes = { customer: customer, unit: [1,2,3,4,5].sample, buy_at: FFaker::Time.date }
    Sale.create!(attributes )
  }
}
