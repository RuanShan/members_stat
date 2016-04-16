require 'ffaker'
100.times.each{|i|
  attributes = {name: FFaker::Name.name, id_num: FFaker::Identification.ssn, cellphone:  FFaker::PhoneNumberSE.phone_number, status: [0,1,2].sample}
  Customer.create!(attributes )
}
