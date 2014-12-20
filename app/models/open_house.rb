class OpenHouse < ActiveRecord::Base
  belongs_to :property

  validates :starts_at, :ends_at, presence: true
  validate :ends_at_cannot_be_before_starts_at, :must_not_be_in_the_past

  scope :upcoming, -> { where('starts_at >= ?', Time.now).order(:starts_at) }

  def ends_at_cannot_be_before_starts_at
    if starts_at > ends_at
    	errors.add(:ends_at, "must be before start date and time")
    end
  end

  def must_not_be_in_the_past
  	if starts_at < Time.now
  		errors.add(:starts_at, "date must not be in the past")
  	end
  end

end
