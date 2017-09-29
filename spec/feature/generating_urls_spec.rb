require 'rails_helper'

describe "the url shortener process", :type => :feature do
  # before :each do
  #   Url.create(long_url: 'www.google.com', short_url: SecureRandom.hex(5)) 
  # end

  it 'the page should take a long url and shorten it' do 
    visit 'urls/new'
    within(".form") do
      fill_in 'shorten', :with => 'https://google.com'
    end
    click_button 
    expect(page).to have_content 'https://google.com'
  end

  # it 'should not raise error when visiting pages' do 
  # #   visit 'urls/show'
  #   visit 'urls/index' 
  # end 
end