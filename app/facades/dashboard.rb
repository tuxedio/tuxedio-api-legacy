class Dashboard
  def initialize(person, session)
    @person = person
    @session = session
  end

  def adventure
    @person.current_adventure(@session[:current_adventure_id])
  end

  def journey
    adventure.journey_items unless adventure.nil?
  end

  private

  attr_reader :person
end
