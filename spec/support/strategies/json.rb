class JsonStrategy
  def initialize
    @strategy = FactoryGirl.strategy_by_name(:attributes_for).new
  end

  delegate :association, to: :@strategy

  def result(evaluation)
    { "#{build_class(evaluation)}" => @strategy.result(evaluation) }.to_json
  end

  private

  def build_class(evaluation)
    evaluation.instance_variable_get(:@attribute_assigner)
      .instance_variable_get(:@build_class)
      .name
      .demodulize
      .downcase
  end
end
