class Hospital < ApplicationRecord
  has_many :doctors

  def count_doctors
    doctors.count
  end

  def university_names
    doctors.pluck(:university).uniq
  end

end
