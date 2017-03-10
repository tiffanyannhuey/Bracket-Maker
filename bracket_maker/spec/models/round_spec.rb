require 'rails_helper'

RSpec.describe Round, type: :model do
  
  describe "validations" do
    it { should validate_presence_of(:number) }

    it { should have_many(:games) }

    it { should have_many(:teams) }
  end
end

