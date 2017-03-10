require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(
    username: "Sam",
    email: "samsonite@co.co",
    password: "password") }

  describe "validations" do
    presence_variables = [:username, :email, :password]

    presence_variables.each do |variable|
      it { should validate_presence_of(variable)}
    end

    it { should have_many(:tournaments) }

    it { should have_many(:games).through(:tournaments)}

    user_columns = [:id, :username, :email, :password_digest]

    user_columns.each do |column|
      it { should have_db_column(column)}
    end

end
end


