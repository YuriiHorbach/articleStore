class CheckoutController < ApplicationController

  def create
    @session = Stripe::Checkout::Session.create({
      success_url: articles_url,
      cancel_url: pricing_url,
      payment_method_types: ['card'],
      line_items: [
        {price: 'price_1JOxVQLdxjZu98zHP9fVmcb9', quantity: 1},
      ],
      mode: 'subscription',
    })
    respond_to do |format|
      format.js
    end
  end

end
