require "rails_helper"

RSpec.describe Patient, type: :model do

  before(:each) do
    @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
    @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

    @sean = Patient.create!(name: "Sean Morris", age: 45)
    @john = Patient.create!(name: "John Jeon", age: 5)
    @haewon = Patient.create!(name: "Haeown Jeon", age: 42)

    @doctor_patient1 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @sean.id)
    @doctor_patient2 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @john.id)
  
  end

  describe "relationships" do
    it { should have_many(:doctor_patients) }
    it { should have_many(:doctors).through(:doctor_patients)}
  end

  describe "class methods" do
    xit "" do

    end
  end
end
