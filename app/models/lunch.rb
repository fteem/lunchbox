class Lunch < ActiveRecord::Base
	validates_presence_of :name, :description, :starts_on, :ends_on

  before_save :set_state

  scope :pending, -> { where('starts_on > ? and ends_on > ?', Date.today, Date.today) }

  private

  def set_state
    if starts_on > Date.today && ends_on > Date.today
      self.state = 'pending'
    elsif starts_on < Date.today && ends_on > Date.today
      self.state = 'started'
    elsif starts_on < Date.today && ends_on < Date.today
      self.state = 'ended'
    else
      raise Exception.new "Cannot be saved, invalid dates."
    end
  end
end