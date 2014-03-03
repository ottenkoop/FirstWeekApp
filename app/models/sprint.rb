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
#  user_id    :integer
#

class Sprint < ActiveRecord::Base
  has_many :userstories
  belongs_to :user

  accepts_nested_attributes_for :userstories

  default_scope order('start_date ASC')

  def multiplier
    (total_us_count_10 / 2 ) + 5
  end

  def total_us_count
    userstories.count
  end

  def total_us_count_10
    userstories.count * 10
  end
end
