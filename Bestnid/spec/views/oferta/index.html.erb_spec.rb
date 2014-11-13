require 'rails_helper'

RSpec.describe "oferta/index", :type => :view do
  before(:each) do
    assign(:oferta, [
      Ofertum.create!(
        :motivo => "Motivo",
        :monto => 1
      ),
      Ofertum.create!(
        :motivo => "Motivo",
        :monto => 1
      )
    ])
  end

  it "renders a list of oferta" do
    render
    assert_select "tr>td", :text => "Motivo".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
