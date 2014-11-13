require 'rails_helper'

RSpec.describe "oferta/edit", :type => :view do
  before(:each) do
    @ofertum = assign(:ofertum, Ofertum.create!(
      :motivo => "MyString",
      :monto => 1
    ))
  end

  it "renders the edit ofertum form" do
    render

    assert_select "form[action=?][method=?]", ofertum_path(@ofertum), "post" do

      assert_select "input#ofertum_motivo[name=?]", "ofertum[motivo]"

      assert_select "input#ofertum_monto[name=?]", "ofertum[monto]"
    end
  end
end
