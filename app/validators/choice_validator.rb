class ChoiceValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.top_choices.each do |choice|
      if ( !Vendor.exists?(:name =>  choice) )
          record.errors[attribute] << (options[:message] || "Vendor is not registered for the site. Tell them to register, it's free!")
      end
    end
  end
end
