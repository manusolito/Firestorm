require 'rails_helper'

RSpec.describe "productos/new", :type => :view do
  before(:each) do
    assign(:producto, Producto.new(
      :nombre => "MyString",
      :descripcion => "MyString",
      :vencimiento => "MyString"
    ))
  end

  it "renders new producto form" do
    render

    assert_select "form[action=?][method=?]", productos_path, "post" do

      assert_select "input#producto_nombre[name=?]", "producto[nombre]"

      assert_select "input#producto_descripcion[name=?]", "producto[descripcion]"

      assert_select "input#producto_vencimiento[name=?]", "producto[vencimiento]"
    end
  end
end
