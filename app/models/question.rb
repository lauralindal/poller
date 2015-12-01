class Question < ActiveRecord::Base
  has_many :answers
  before_create :generate_url, unless: :url?
  validates :title, presence: true
  validates :url, uniqueness: true

  private

    def generate_url
      self.url = SecureRandom.uuid
    end
end
