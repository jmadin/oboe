class Project < ActiveRecord::Base
  has_many :observations, :dependent => :destroy
  accepts_nested_attributes_for :observations, :reject_if => :all_blank, :allow_destroy => true

  has_many :contexts, :dependent => :destroy
  accepts_nested_attributes_for :contexts, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :project_name, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true

  # Returns projects from the users being followed by the given user.
  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships
                         WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
          user_id: user.id)
  end
end
