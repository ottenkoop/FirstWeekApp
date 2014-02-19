# == Schema Information
#
# Table name: userstories
#
#  id         :integer          not null, primary key
#  content    :text
#  rating     :integer
#  sprint_id  :integer
#  created_at :datetime
#  updated_at :datetime
#

class Userstory < ActiveRecord::Base
  belongs_to :sprint

  def total_userstories
  	Userstory.count
  end


end