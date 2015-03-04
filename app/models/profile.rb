class Profile < ActiveRecord::Base
  belongs_to :user

  has_attached_file :avatar, styles: { :thumb => "200x200", :medium => "300x300" }

  validates_attachment :avatar, presence: true,
    content_type: { :content_type => "image/jpeg"},
    size: { :in => 0..1.megabytes }

  validates_presence_of :first_name, :last_name, :bio

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name=(name)
    self.first_name, self.last_name = name.split[0, 2]
  end
end
