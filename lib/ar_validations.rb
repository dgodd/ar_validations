require "active_record"
require "active_support/concern"

module ArValidations
  autoload :VERSION, "ar_validations/version"
  extend ActiveSupport::Concern

  included do
    columns.each do |column|
      next if column.primary

      if !column.null
        validates column.name, presence: true
      end
    end
  end
end
