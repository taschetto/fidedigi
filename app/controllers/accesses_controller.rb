class AccessesController < ApplicationController
  layout :layout
  def index
    @accesses = Hash.new(0)
    @accesses[:day] = Access.find_by(accessed_at: Date.today).access_count
    month_accesses = Access.where("accessed_at >= ? AND accessed_at <= ?", Date.today.at_beginning_of_month, Date.today.at_end_of_month)
    year_accesses = Access.where("accessed_at >= ? AND accessed_at <= ?", Date.today.at_beginning_of_year, Date.today.at_end_of_year)

    month_accesses.each do |a|
      @accesses[:month] += a.access_count
    end

    year_accesses.each do |a|
      @accesses[:year] += a.access_count
    end
  end

  def layout
    return "devise" if current_user.nil?
    "application"
  end
end
