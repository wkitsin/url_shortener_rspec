require 'rails_helper'

RSpec.describe "urls/show.html.erb", type: :view do
	let( :long_url ) { "http://google.com" }
	let( :short_url ) { SecureRandom.hex(5) }

  it 'should contain a long_url along with a short_url' do 
  	assign :object, Url.create(long_url: long_url, short_url: short_url)
  	render 
  	expect(rendered).to have_css("p", text: long_url)
  	expect(rendered).to have_css("p", text: short_url)
  end 
end
