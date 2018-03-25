#require 'rails_helper'

#RSpec.describe WikisController, type: :controller do

  #describe "GET #index" do
    #it "returns http success" do
      #get :index
      #expect(response).to have_http_status(:success)
    #end
  #end

  #describe "GET #show" do
    #it "returns http success" do
      #get :show
      #expect(response).to have_http_status(:success)
    #end
  #end

  #describe "GET #new" do
    #it "returns http success" do
      #get :new
      #expect(response).to have_http_status(:success)
    #end
  #end

  #describe "GET #edit" do
    #it "returns http success" do
      #get :edit
      #expect(response).to have_http_status(:success)
    #end
  #end
  require 'rails_helper'
  include RandomData
  
  RSpec.describe WikisController, type: :controller do

  let(:my_wiki) { Wiki.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, private: false) }

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end
end
