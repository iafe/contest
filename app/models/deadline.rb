class Deadline < ActiveRecord::Base
  
  # There are two deadlines: the "deadline" column, and the "actual deadline" column.
  # The deadline column is the date that is displayed on the front page (the countdown). That is the only place it is used. It should match
  # the deadline date in the official rules distributed.
  # The actual deadline is the date in which the system will no longer accept entries that year. It is not visible to users. It can be further out
  # from the public deadline in case IAFE staff needs to finish uploading submissions past the deadline, or if a fair ends too close to the deadline.
  # Both of these values should be freshly created right around New Year's Eve or New Year's Day.
  
  validates :deadline, presence: true
  validates :actual_deadline, presence: true
  
end
