FactoryGirl.define do  factory :answer do
    description "MyText"
question nil
  end

  factory :question do
    title "Have you seen my pancake stack?"
  end
end
