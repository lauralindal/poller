FactoryGirl.define do

  factory :user do
    name "Jessica Jones"
    email "cheap@whiskey.com"
    password "foobarschnaps"
    password_confirmation "foobarschnaps"
  end

  factory :question do
    title "Have you seen my pancake stack?"
  end

  factory :answer do
    description "Cupcake"
  end
end
