class FutureDateValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      if value < Date.today
        record.errors[attribute] << (options[:message] || "Data tem qeu ser futura")
      end
    end
  end
end