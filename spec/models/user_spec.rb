require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a name" do
    expect(User.new(name: "Trish Walker").valid?).to eq true
  end
end
