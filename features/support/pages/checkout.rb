require 'rspec'

class CheckoutPage
    include Capybara::DSL
    include RSpec::Matchers

    def assert_product_details(product)
        product_title = find('.item-details h1')
        expect(product_title.text).to eql product[:'Nome']
        sub_price = find('.subtotal .sub-price')
        expect(sub_price.text).to eql product[:'Preço']
        delivery_price = find('.delivery-price')
        expect(delivery_price.text).to eql product[:'Entrega']
    end

    def assert_total_price(total_price)
        price = find('.total-price')
        expect(price.text).to eql total_price
    end

    def fill_zipcode(zipcode) 
        find('input[name=cep]').set(zipcode)
        click_on 'Buscar CEP'
    end

    def fill_address(address)
        find('input[name=number]').set(address[:'Número'])
        find('input[name=complement]').set(address[:'Complemento'])
    end

    def choose_payment_type(payment_type)
        find('label div', text: payment_type.upcase).click
    end

    def submit
        click_on 'Confirmar pedido'
    end

    def set_coupon(coupon_code)
        find('input[placeholder="Código do cupom"]').set(coupon_code)
        click_on 'Aplicar'
    end

    def assert_notification(text)
        notification = find('.notice')
        expect(notification.text).to eql text
    end
end