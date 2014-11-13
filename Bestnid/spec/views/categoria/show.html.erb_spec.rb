require 'rails_helper'

RSpec.describe "categoria/show", :type => :view do
  before(:each) do
    @categorium = assign(:categorium, Categorium.create!(
      :nombre => "Nombre"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Nombre/)
  end
end
