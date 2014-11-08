require 'rails_helper'

RSpec.describe "categoria/index", :type => :view do
  before(:each) do
    assign(:categoria, [
      Categorium.create!(
        :nombre => "Nombre"
      ),
      Categorium.create!(
        :nombre => "Nombre"
      )
    ])
  end

  it "renders a list of categoria" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
  end
end
