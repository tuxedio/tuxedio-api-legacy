require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "The email address format is invalid")
    end
  end
end

class VendorValidator < ActiveModel::Validator
  def validate(record)

    if (record.user_role == "Vendor" && !record.location.in?(User.allowed_locations) )
      record.errors[:base] << "Vendors are not permitted in this area yet."
    end
  end

end
