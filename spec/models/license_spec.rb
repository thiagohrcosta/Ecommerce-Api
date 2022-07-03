require 'rails_helper'

RSpec.describe License, type: :model do
  describe "validations" do
    it { should validate_presence_of :game_id }
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :key }
  end

  describe "associations" do
    it { should belong_to :game }
    it { should belong_to :user }
  end

end
