class Sale < ActiveRecord::Base
  #enum status: [ :pending, :bonus, :kickout ]

  belongs_to :customer

  after_create :update_customer_shares
  before_create :fix_nil_attributes

  validates :customer, presence: true

  def day( datetime = DateTime.current )
    SaleDay.new( self, datetime )
  end

  private
  def fix_nil_attributes
    self.buy_at ||= DateTime.current
  end

  def update_customer_shares
    self.customer.update_attribute :hold_shares, self.customer.sales.sum(:unit)
  end

end
