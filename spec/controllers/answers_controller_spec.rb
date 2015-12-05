require 'rails_helper'

RSpec.describe AnswersController, type: :controller do

  describe "PATCH #update" do
    it "returns http success" do
      answer = create(:answer)
      patch :update, id: answer.id
      expect(response).to have_http_status(:success)
    end
  end
end
