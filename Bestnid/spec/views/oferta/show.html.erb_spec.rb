require 'rails_helper'

RSpec.describe "oferta/show", :type => :view do
  before(:each) do
    @ofertum = assign(:ofertum, Ofertum.create!(
      :motivo => "Motivo",
      :monto => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Motivo/)
    expect(rendered).to match(/1/)
  end
end
