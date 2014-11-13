require 'rails_helper'

RSpec.describe "usuarios/new", :type => :view do
  before(:each) do
    assign(:usuario, Usuario.new(
      :nombre => "MyString",
      :dni => 1,
      :email => "MyString",
      :tarjeta => 1,
      :contrasenia => "MyString"
    ))
  end

  it "renders new usuario form" do
    render

    assert_select "form[action=?][method=?]", usuarios_path, "post" do

      assert_select "input#usuario_nombre[name=?]", "usuario[nombre]"

      assert_select "input#usuario_dni[name=?]", "usuario[dni]"

      assert_select "input#usuario_email[name=?]", "usuario[email]"

      assert_select "input#usuario_tarjeta[name=?]", "usuario[tarjeta]"

      assert_select "input#usuario_contrasenia[name=?]", "usuario[contrasenia]"
    end
  end
end
