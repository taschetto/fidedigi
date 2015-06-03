class Access < ActiveRecord::Base
  def self.inc
    access = Access.find_or_create(Date.today)
    access.access_count += 1
    access.save
  end

  def self.find_or_create date
    access = Access.find_by(accessed_at: date)
    if access.nil?
      access = Access.new
      access.accessed_at = date
      access.access_count = 0
    end
    access
  end
end
