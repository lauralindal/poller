require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with a title" do
    expect(Question.new(title: "Foo").valid?).to eq(true)
  end
  it "is not valid without a title" do
    expect(Question.new().valid?).to eq(false)
  end
  it "has a unique URL" do
    Question.create(title: "Unicorn Rainbow?", url: "jhgl")
    expect(Question.create(title: "Doughnut Rainbow?",url: "jhgl").valid?).to be(false)
  end
  it "is initialized with a url" do
    question = Question.create(title: "Are you Pinkie Pie?")
    expect(question.url).to_not be nil
  end
end
