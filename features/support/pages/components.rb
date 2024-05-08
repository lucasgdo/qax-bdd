require 'rspec'

class Popup
    include Capybara::DSL
    include RSpec::Matchers
    
    def have_text(text)
        popup = first('div', text: text)
        expect(popup).to be_visible
    end
end