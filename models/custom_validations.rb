class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class ExclusiveValidator < ActiveModel::Validator
  def validate(record)

    # check if all types are exclusively equal (valid)
    unless ((record.blogger != record.vendor) != record.customer)
      record.errors[:base] << "Customer is not exclusive type"
    end

    # check if all types are equal (invalid)
    types = [record.blogger, record.vendor, record.customer]
    if (types.all? { |elem| elem == true } or types.all? { |elem| elem == false })
      record.errors[:base] << "Customer has all 3 types"
    end

  end
end
