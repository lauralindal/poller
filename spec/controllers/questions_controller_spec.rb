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

  describe "GET #show" do
    skip it "returns http success for known id" do
      question = create(:question)
      get :show, id: question.url
      expect(response).to have_http_status(:success)
    end
    skip it "returns http redirect if record does not exist" do
      get :show, id: 'schnulli'
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "POST #create" do
    skip it "saves a question to database" do
      post :create, question: attributes_for(:question)
      expect(Question.all.count).to eq(1)
    end
    skip it "does not save an invalid question to database" do
      post :create, question: attributes_for(:question, title: nil)
      expect(Question.all.count).to eq(0)
    end
  end
end
