class CustomersController < ResourceController

  def day
    
  end


  def collection
    Customer.page( params[:page])
  end

end
