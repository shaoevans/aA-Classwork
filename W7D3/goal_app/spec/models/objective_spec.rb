require 'rails_helper'

RSpec.describe Objective, type: :model do
  subject(:evans) { Objective.create(author_id: 1, body: "evans123", title: "abcd")}
  describe "validations" do 
    it { should validate_presence_of(:author_id)}
    it { should validate_presence_of(:body)}
    it { should validate_presence_of(:title)} 
    it { should validate_uniqueness_of(:title).scoped_to(:author_id)}
  end
  describe "assocations" do
    it { should have_many(:cheers)}
    it { should belong_to(:author)}
  end
end
