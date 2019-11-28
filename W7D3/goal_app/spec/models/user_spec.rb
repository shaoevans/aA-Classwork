require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:evans) { User.create(username: "evans", password: "evans123")}
  describe "validations" do 
    it { should validate_presence_of(:username)}
    it { should validate_presence_of(:password_digest)}
    it { should validate_presence_of(:remaining_cheers)} 
    it { should validate_uniqueness_of(:username)}
    it { should validate_uniqueness_of(:session_token)}
  end
  describe "assocations" do
    it { should have_many(:cheers)}
    it { should have_many(:objectives)} 
  end
end
