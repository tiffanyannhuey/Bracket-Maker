require 'rails_helper'

RSpec.describe Round, type: :model do
  
  describe "validations" do
    it { should validate_presence_of(:number) }

    it { should have_many(:games) }

    it { should have_many(:teams) }

    it { should have_one(:admin) }

    it { should belong_to(:tournament) }

    round_columns = [:id, :number, :tournament_id]

    round_columns.each do |column|
      it { should have_db_column(column) }
    end

  end
end

