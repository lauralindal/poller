require 'rails_helper'

RSpec.describe Question, type: :model do
  it "is valid with a title" do
    expect(Question.new(title: "Foo").valid?).to eq(true)
  end
  it "is not valid without a title" do
    expect(Question.new().valid?).to eq(false)
  end
end
