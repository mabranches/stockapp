require 'rails_helper'

RSpec.describe User, type: :model do
 describe "User email" do
   it "should generate an user mail" do
     user = create(:user)
     expect(user.email).to eq user.mail
   end
 end
end
