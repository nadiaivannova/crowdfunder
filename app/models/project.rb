class Project < ActiveRecord::Base
  # require 'pry'
  has_many :rewards
  has_many :pledges
  has_many :backers, through: :pledges, source: :user
  belongs_to :owner, class_name: 'User'

  validates :owner_id, :title, :description, :goal, :start_date, :end_date, presence: true
  validate :start_date_in_future

  def start_date_in_future

    if self.start_date >= Date.today
      
     else
       self.errors[:project] << 'Project start must be in future.'
     end
   end

 end
