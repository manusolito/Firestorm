require 'rails_helper'

RSpec.describe "productos/index", :type => :view do
  before(:each) do
    assign(:productos, [
      Producto.create!(
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :vencimiento => "Vencimiento"
      ),
      Producto.create!(
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :vencimiento => "Vencimiento"
      )
    ])
  end

  it "renders a list of productos" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Vencimiento".to_s, :count => 2
  end
end
