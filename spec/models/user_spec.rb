require 'rails_helper'

RSpec.describe User, type: :model do
  skip it "is valid with a name" do
    expect(User.new(name: "Trish Walker", email: "krav@maga.self").valid?).to eq true
  end
  it "is invalid without a name" do
    expect(User.new().valid?).to eq false
  end
  it "has a unique email" do
    create(:user, email: "patsy@walker.com")
    expect(User.create(name: "Jewel", email: "patsy@walker.com").valid?).to be(false)
  end
  skip it "rejects invalid email formats" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                         foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      user = create(:user, email: "krav@maga.defense")
      user.email = invalid_address
      expect(user.valid?).to eq false
    end
  end
  it "password is not blank" do
    user = create(:user)
    user.password = user.password_confirmation = "" * 6
    expect(user.password).not_to be_empty
  end
end
