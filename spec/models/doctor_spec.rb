require 'rails_helper'

RSpec.describe Doctor do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

      @sean = Patient.create!(name: "Sean Morris", age: 45)
      @john = Patient.create!(name: "John Jeon", age: 5)
      @haewon = Patient.create!(name: "Haeown Jeon", age: 42)

      @doctor_patient1 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @sean.id)
      @doctor_patient2 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @john.id)
    end

  describe 'relationships' do
    it { should belong_to(:hospital) }
    it { should have_many(:doctor_patients) }
    it { should have_many(:patients).through(:doctor_patients)}
  end

  describe "instance methods" do
    it "#find_hospital" do
      expect(@dr_bailey.find_hospital.name).to eq("Grey Sloan Memorial Hospital")
    end
  end
end
