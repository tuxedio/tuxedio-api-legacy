class LocationValidator < ActiveModel::Validator
  def validate(record)
    if !record.location.in?(Vendor.allowed_locations)
      record.errors[:base] << "Vendors are not permitted in this area yet."
    end
  end
end
