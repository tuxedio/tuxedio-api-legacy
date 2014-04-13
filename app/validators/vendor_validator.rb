class VendorValidator < ActiveModel::Validator
  def validate(record)
    if !record.location.in?(User.allowed_locations)
      record.errors[:base] << "Vendors are not permitted in this area yet."
    end
  end
end
