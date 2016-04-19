class Day < ActiveRecord::Base
  #acts_as_paranoid
  scope :during_year, ->{ where( ["free_date> ? and free_date < ?", DateTime.current.ago(6.months), DateTime.current.since(6.months) ]) }

  scope :after_date, ->(date){  where(['free_date>=?', date ]) }

  scope :during_dates, ->( start_date, end_date){ where(['free_date>=? and free_date < ?', start_date, end_date ]) }
end
