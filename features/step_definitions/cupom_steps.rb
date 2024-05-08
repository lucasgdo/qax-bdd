Dado('que iniciei a compra do item:') do |product|
    @product = product.rows_hash
    @home.open
    @home.buy(@product[:'Nome'])
  end
  
  Quando('aplico o seguinte cupom: {string}') do |coupon_code|
    @checkout.set_coupon(coupon_code)
  end
  
  Então('o valor final da compra deve ser atualizado para {string}') do |final_price|
    @checkout.assert_total_price(final_price)
  end

  Então('devo ver a notificação {string}') do |notification|
    @checkout.assert_notification(notification)
  end
  
  Então('o valor final da compra deve permanecer o mesmo') do
    @checkout.assert_total_price(@product[:'Total'])
  end