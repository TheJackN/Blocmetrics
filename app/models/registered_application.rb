class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  has_many :events, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true, :uniqueness => { scope: :user_id }
  validates :url,  presence: true, :uniqueness => { scope: :user_id } #add functionality to confirm url is in a valid url format
end
