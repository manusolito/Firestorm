require 'rails_helper'

RSpec.describe "productos/edit", :type => :view do
  before(:each) do
    @producto = assign(:producto, Producto.create!(
      :nombre => "MyString",
      :descripcion => "MyString",
      :vencimiento => "MyString"
    ))
  end

  it "renders the edit producto form" do
    render

    assert_select "form[action=?][method=?]", producto_path(@producto), "post" do

      assert_select "input#producto_nombre[name=?]", "producto[nombre]"

      assert_select "input#producto_descripcion[name=?]", "producto[descripcion]"

      assert_select "input#producto_vencimiento[name=?]", "producto[vencimiento]"
    end
  end
end
