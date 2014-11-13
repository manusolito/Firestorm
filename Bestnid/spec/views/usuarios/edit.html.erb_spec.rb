require 'rails_helper'

RSpec.describe "usuarios/edit", :type => :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :nombre => "MyString",
      :dni => 1,
      :email => "MyString",
      :tarjeta => 1,
      :contrasenia => "MyString"
    ))
  end

  it "renders the edit usuario form" do
    render

    assert_select "form[action=?][method=?]", usuario_path(@usuario), "post" do

      assert_select "input#usuario_nombre[name=?]", "usuario[nombre]"

      assert_select "input#usuario_dni[name=?]", "usuario[dni]"

      assert_select "input#usuario_email[name=?]", "usuario[email]"

      assert_select "input#usuario_tarjeta[name=?]", "usuario[tarjeta]"

      assert_select "input#usuario_contrasenia[name=?]", "usuario[contrasenia]"
    end
  end
end
