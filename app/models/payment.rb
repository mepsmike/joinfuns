class Payment < ActiveRecord::Base
  serialize :params, JSON
  belongs_to :order

  after_update :update_order_status


  def self.find_and_process(params)
    payment = self.find(params[:MerchantTradeNo].to_i)
    payment.paid = params['RtnCode'] == '1'
    payment.amount = params['TradeAmt']
    payment.params = params
    payment
  end

  private

  def update_order_status
    if self.paid
      o = self.order
      o.payment_status = "paid"
      o.save( :validate => false )

      u = self.order.user
      u.money += self.amount.to_f
      u.save
    end
  end

end
