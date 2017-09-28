require 'rails_helper'

RSpec.describe "urls/new.html.erb", type: :view do
  it 'should contain a form and a button' do 
  	assign :url, Url.new
  	render 
  	# byebug 
  	expect(rendered).to have_css("form")
  	expect(rendered).to have_css("label")
  	expect(rendered).to have_css("a")
  	expect(rendered).to have_css("h3", text: "urls/new")
  end 
end
