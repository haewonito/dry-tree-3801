require "rails_helper"

RSpec.describe DoctorPatient, type: :model do
  describe "relationship" do
    it { should belong_to(:doctor) }
    it { should belong_to(:patient) }
  end

  describe "class methods" do
    xit "" do

    end
  end
end
