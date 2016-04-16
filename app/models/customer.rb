class Customer < ActiveRecord::Base
  has_many :sales, dependent: :delete_all
  enum status: [ :pending, :bonus, :kickout ]

  before_save :set_bouns_related_timestamp

  def day
    Day.new( self )
  end

  private
  def set_bouns_related_timestamp
    if self.bonus? && self.bonus_started_at.blank?
      self.bonus_started_at = DateTime.current
    end

    if self.kickout? && self.kickout_at.blank?
      self.kickout_at = DateTime.current
    end
  end
end
