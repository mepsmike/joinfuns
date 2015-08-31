class Order < ActiveRecord::Base
  belongs_to :user

  def paid?
    self.payment_status == "paid"
  end

end
