
class Character
  attr_reader :profile, :name, :actor, :salary

  def initialize(profile)
    @profile = profile
    @name = profile[:name]
    @actor = profile[:actor]
    @salary = profile[:salary]
  end

end
