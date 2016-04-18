module SalesHelper
  def sale_buy_at_form_column(record, options)
    date_select :record, :buy_at, options.merge( { data: { provide: 'datepicker' } } )
  end
end
