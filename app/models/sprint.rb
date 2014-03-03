# == Schema Information
#
# Table name: sprints
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  start_date :datetime
#  end_date   :datetime
#  goal       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Sprint < ActiveRecord::Base
  has_many :userstories

  accepts_nested_attributes_for :userstories

  default_scope order('start_date ASC')

  def multiplier
    ((userstories.count / 2) + 0.5) * 10
  end

  def total_us_count
    userstories.count
  end

  def total_points
    8 * 20
  end
end