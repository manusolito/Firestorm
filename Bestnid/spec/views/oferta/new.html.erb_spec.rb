require 'rails_helper'

RSpec.describe "oferta/new", :type => :view do
  before(:each) do
    assign(:ofertum, Ofertum.new(
      :motivo => "MyString",
      :monto => 1
    ))
  end

  it "renders new ofertum form" do
    render

    assert_select "form[action=?][method=?]", oferta_path, "post" do

      assert_select "input#ofertum_motivo[name=?]", "ofertum[motivo]"

      assert_select "input#ofertum_monto[name=?]", "ofertum[monto]"
    end
  end
end
