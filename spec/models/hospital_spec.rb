require 'rails_helper'

RSpec.describe Hospital do

  describe 'relationships' do
    it { should have_many(:doctors) }
  end

  describe "instance methods" do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @dr_pompeo = @hospital.doctors.create!(name: "Meredith Grey", specialty: "Cardiology", university: "UC Berkeley")
      @dr_bailey = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Stanford University")
    end

    it "#count_doctors" do
      expect(@hospital.count_doctors).to eq(3)
    end

    it "#university_names" do
      expect(@hospital.university_names).to include("Stanford University")
      expect(@hospital.university_names).to include("UC Berkeley")
    end
  end

end
