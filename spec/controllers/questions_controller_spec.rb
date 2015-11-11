require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    it "instantiates a new question" do
      get :new
      expect(assigns(:question)).to_not be nil
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST #create" do
    it "saves a question to database" do
      post :create,question: attributes_for(:question)
      expect(Question.all.count).to eq(1)
    end
  end

end
