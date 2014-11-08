require 'rails_helper'

RSpec.describe "categoria/edit", :type => :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :nombre => "MyString"
    ))
  end

  it "renders the edit categorium form" do
    render

    assert_select "form[action=?][method=?]", categorium_path(@categorium), "post" do

      assert_select "input#categorium_nombre[name=?]", "categorium[nombre]"
    end
  end
end
