class TopChoicesValidator < ActiveModel::Validator
  def validate(record)
    record.top_choices.each do |i|
      if ( !Vendor.exists?(:name =>  record.top_choices[i] ))
          record.errors[:base] << "Vendor is not registered for the site. Tell them to register, it's free!"
      end
    end
  end
end
