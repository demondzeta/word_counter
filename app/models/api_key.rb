class ApiKey < ActiveRecord::Base
  validates :mail, presence: true, uniqueness: true
  validates_format_of :mail, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  def self.update_counter(api_key)
    model = self.find_by_api_key(api_key)
    model.update(times_used: (model.times_used + 1))
  end
end
