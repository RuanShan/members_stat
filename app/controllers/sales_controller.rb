class SalesController < ResourceController
  #active_scaffold :sale do |config|
  #  config.create.columns.set_values :customer, :price, :unit, :buy_at
  #  config.columns[:customer].form_ui = :select
  #  #config.columns[:customer_id].options = {:options => [['some text', 'some value'], ['another text', 'another value']]}
  #  #config.columns[:buy_at].form_ui = :date_picker
  #end
  def collection
    Sale.page( params[:page])
  end
end
