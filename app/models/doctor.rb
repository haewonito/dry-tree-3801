class Doctor < ApplicationRecord
  belongs_to :hospital
  has_many :doctor_patients
  has_many :patients, through: :doctor_patients

  def find_hospital
    Hospital.find(hospital_id)
  end

  def find_patients_name
    doctor_patients.
  end
end
