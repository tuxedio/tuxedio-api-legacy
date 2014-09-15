class LocationValidator < ActiveModel::Validator
  def validate(record)
    if !record.location.in?(Vendor.allowed_locations)
      record.errors[:base] << "Vendors are currently only limited to Boulder, Broomfield, and Longmont. We hope to serve more areas soon!"
    end
  end
end
