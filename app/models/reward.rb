class Reward < ActiveRecord::Base
  belongs_to :project

  validates :dollar_amount, :description, :project, presence: true
end
