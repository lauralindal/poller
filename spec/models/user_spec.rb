require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    expect(User.new(name: "Trish Walker").valid?).to eq true
  end
  it "is invalid without a name" do
    expect(User.new().valid?).to eq false
  end
  it "has a unique email" do
    create(:user, email: "patsy@walker.com")
    expect(User.create(name: "Jewel", email: "patsy@walker.com").valid?).to be(false)
  end
end
