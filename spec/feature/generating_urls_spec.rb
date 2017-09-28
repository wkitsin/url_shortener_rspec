require 'rails_helper'

describe "the url shortener process", :type => :feature do
  before :each do
    Url.create(long_url: 'www.google.com')
  end

  # it "shortens the url" do
  #   visit '/urls/new'
  #   within(".shorten") do
  #     fill_in 'long_url', :with => 'https://google.com'
  #   end
  #   click_button 'Shoten URL!'
  #   expect(page).to have_content 'Success'
  # end
end