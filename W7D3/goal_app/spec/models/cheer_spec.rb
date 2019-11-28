require 'rails_helper'

RSpec.describe Cheer, type: :model do
  subject(:evans) { Cheer.create(author_id: 1, objective_id: 1)}
  describe "validations" do 
    it { should validate_presence_of(:author_id)}
    it { should validate_presence_of(:objective_id)}
    it { should validate_uniqueness_of(:objective_id).scoped_to(:author_id)}
  end
  describe "assocations" do
    it { should belong_to(:author)}
    it { should belong_to(:objective)}
  end
end
