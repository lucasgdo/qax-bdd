require 'rspec'

class OrderPage

    include Capybara::DSL
    include RSpec::Matchers

    def assert_order
        expect(find('h1').text).to eql 'Uhull! Pedido confirmado'
        expect(find('p[color=subtitle]').text).to eql 'Agora é só aguardar que logo o café chegará até você'
    end

    def assert_delivery_time(target)
        expect(find('p', text: 'Previsão de entrega').find('strong').text).to eql target
    end
end