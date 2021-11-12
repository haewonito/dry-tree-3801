class PatientsController
  def index
    @patients = Patient.all
  end
end
