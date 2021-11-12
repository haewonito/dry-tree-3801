require "rails_helper"

RSpec.describe "hospital show page", type: :feature do
  describe "as a visitor" do
    before(:each) do
      @hospital = Hospital.create!(name: "Grey Sloan Memorial Hospital")
      @dr_bailey = @hospital.doctors.create!(name: "Miranda Bailey", specialty: "General Surgery", university: "Stanford University")
      @dr_pompeo = @hospital.doctors.create!(name: "Meredith Grey", specialty: "Cardiology", university: "UC Berkeley")
      @dr_bailey = @hospital.doctors.create!(name: "Alex Karev", specialty: "Pediatrics", university: "Stanford University")

      visit "/hospitals/#{@hospital.id}"
    end

    it "see the hospital's name" do
      expect(page).to have_content("Grey Sloan Memorial Hospital")
    end

    it "see the number of doctors that work at this hospital" do
      expect(page).to have_content("Number of doctors at this hospital: 3")
    end

    it "see a unique liste of universities that this hospital's doctors attended" do
      expect(page).to have_content("Stanford University", count: 1)
      expect(page).to have_content("UC Berkeley", count: 1)
    end
  end
end
