require "rails_helper"

RSpec.describe "patients index page", type: :feature do
  describe "as a visitor" do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

      @sean = Patient.create!(name: "Sean Morris", age: 45)
      @john = Patient.create!(name: "John Jeon", age: 5)
      @haewon = Patient.create!(name: "Haeown Jeon", age: 42)

      @doctor_patient1 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @sean.id)
      @doctor_patient2 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @john.id)
      @doctor_patient3 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @haewon.id)
      visit "/patients"
    end

    xit "I see names of all patients listed from oldest to yougest" do
      within "#patients-list" do
        expect("#{@sean.name}").to appear_before("#{@john.name}")
      end
    end
  end
end
