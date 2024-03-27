class FuelCalculator
  GRAVITY = {
    "Earth" => 9.807,
    "Moon" => 1.62,
    "Mars" => 3.711
  }
  LAUNCH_MULTIPLIER = 0.042
  LAUNCH_SUBTRACTOR = 33
  LANDING_MULTIPLIER = 0.033
  LANDING_SUBTRACTOR = 42

  def initialize(mass, planet)
    # since it's NASA i assume that there is some validation and i don't need to check
    # that mass and planet are not nil and in correct format, correct values. 
    # if not than there can be added some checks to raise exception

    @mass = mass
    @planet = planet
  end

  def launch_fuel
    calculate_fuel(LAUNCH_MULTIPLIER, LAUNCH_SUBTRACTOR)
  end

  def landing_fuel
    calculate_fuel(LANDING_MULTIPLIER, LANDING_SUBTRACTOR)
  end

  private

  def calculate_fuel(multiplier, subtractor)
    (@mass * GRAVITY[@planet] * multiplier - subtractor).to_i
  end
end
