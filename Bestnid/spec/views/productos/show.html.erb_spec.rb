require 'rails_helper'

RSpec.describe "productos/show", :type => :view do
  before(:each) do
    @producto = assign(:producto, Producto.create!(
      :nombre => "Nombre",
      :descripcion => "Descripcion",
      :vencimiento => "Vencimiento"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
    expect(rendered).to match(/Descripcion/)
    expect(rendered).to match(/Vencimiento/)
  end
end
