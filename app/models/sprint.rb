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
end
