
require "rails_helper"

RSpec.describe "doctors show page", type: :feature do
  describe "as a visitor" do
    before(:each) do

      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")

      @sean = Patient.create!(name: "Sean Morris", age: 45)
      @john = Patient.create!(name: "John Jeon", age: 5)
      @haewon = Patient.create!(name: "Haeown Jeon", age: 42)

      @doctor_patient1 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @sean.id)
      @doctor_patient2 = DoctorPatient.create!(doctor_id: @dr_bailey.id, patient_id: @john.id)
      visit "/doctors/#{@dr_bailey.id}"
    end

    it "I see doctor's name, specialty and university" do
      expect(page).to have_content("Miranda Bailey")
      expect(page).to have_content("General Surgery")
      expect(page).to have_content("Stanford University")
    end

    it "I see the hospital name where this doctor works" do
      expect(page).to have_content("#{@hospital.name}")
    end

    it "I see all the patients this doctor has" do
      expect(page).to have_content("Sean Morris")
      expect(page).to have_content("John Jeon")
      expect(page).to_not have_content("Haewon Jeon")
    end
  end
end
