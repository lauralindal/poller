require 'rails_helper'

RSpec.describe Question, type: :model do
  skip it "is valid with a title" do
    expect(Question.new(title: "Foo").valid?).to eq(true)
  end
  it "is not valid without a title" do
    expect(Question.new().valid?).to eq(false)
  end
  skip it "has a unique URL" do
    create(:question, url: "jhgl")
    expect(Question.create(title: "Doughnut Rainbow?", url: "jhgl").valid?).to be(false)
  end
  skip it "is initialized with a url" do
    question = create(:question)
    expect(question.url).to_not be nil
  end
end
