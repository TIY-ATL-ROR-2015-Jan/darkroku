class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile, dependent: :destroy
  validates :username, presence: true, uniqueness: true

  after_create :set_default_profile!

  private
  def set_default_profile!
    defaults = {
      :first_name => 'Edit',
      :last_name => 'Me',
      :bio => "A long and happy story."
    }
    unless self.profile
      self.profile = Profile.create(defaults)
    end
  end
end
