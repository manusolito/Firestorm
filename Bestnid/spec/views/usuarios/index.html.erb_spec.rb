require 'rails_helper'

RSpec.describe "usuarios/index", :type => :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
        :nombre => "Nombre",
        :dni => 1,
        :email => "Email",
        :tarjeta => 2,
        :contrasenia => "Contrasenia"
      ),
      Usuario.create!(
        :nombre => "Nombre",
        :dni => 1,
        :email => "Email",
        :tarjeta => 2,
        :contrasenia => "Contrasenia"
      )
    ])
  end

  it "renders a list of usuarios" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Contrasenia".to_s, :count => 2
  end
end
