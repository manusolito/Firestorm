require 'rails_helper'

RSpec.describe "usuarios/show", :type => :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :nombre => "Nombre",
      :dni => 1,
      :email => "Email",
      :tarjeta => 2,
      :contrasenia => "Contrasenia"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Contrasenia/)
  end
end
