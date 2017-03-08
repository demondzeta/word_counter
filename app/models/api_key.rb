class ApiKey < ActiveRecord::Base
  validates :mail, presence: true, uniqueness: true
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end
