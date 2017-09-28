require 'rails_helper'

RSpec.describe UrlsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let( :valid_params )          { { url: { long_url: "http://example.com" }} }
    let( :invalid_params )        { { url: { long_url: "google" }} }


    context "when valid params" do
      it "should save url" do
        post :create, valid_params
        expect(Url.find_by(valid_params[:url])).not_to eq nil
      end

      it "should redirect to #index" do
        post :create, valid_params
        expect(response).to redirect_to( urls_path )
      end
    end

    context "when invalid params" do
      it "should rerender submission page" do
        post :create, invalid_params
        expect(Url.find_by(invalid_params[:url])).to eq nil
        expect(response).to render_template(:new)
      end

      it "should render with generated errors" do
        post :create, invalid_params
        # byebug 
        expect(assigns(:errors)).not_to eq nil
      end
    end
  end
end
