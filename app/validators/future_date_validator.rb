class FutureDateValidator < ActiveModel::Validator
  def validate(record)
    if record.start_date < Date.today
      record.errors[:base] << "Your trip start date is before today. Unfortunately we do not have time machines. Please choose the present date or a future date."
    end
  end
end
