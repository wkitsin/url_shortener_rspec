require 'rails_helper'

RSpec.describe "urls/index.html.erb", type: :view do
  
  let( :long_url ) { "http://google.com" }
  let( :short_url ) { SecureRandom.hex(5) }

  it 'displays the table of all the urls' do 
  	a = Url.create(long_url: "#{long_url}", short_url: short_url)
  	a.save 
  	# @url = Url.all
  	assign :url, Url.all
  	render 
  	expect(rendered).to have_css("td", text: long_url)
  end 

end
