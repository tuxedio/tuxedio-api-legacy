class LocationValidator < ActiveModel::Validator
  def validate(record)
    unless record.location.in? V1::Vendor.allowed_locations
      record.errors[:base] << "Vendors are currently only limited to Boulder, Broomfield, and Longmont. We hope to serve more areas soon!"
    end
  end
end
