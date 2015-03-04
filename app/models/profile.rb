class Profile < ActiveRecord::Base
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(name)
    self.first_name, self.last_name = name.split[0, 2]
  end
end
