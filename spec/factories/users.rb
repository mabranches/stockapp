require 'ffaker'

FactoryGirl.define do
  factory :user do
      FFaker::Internet.email
  end
end
