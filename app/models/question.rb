class Question < ActiveRecord::Base
  has_many :answers
  before_create :generate_url, unless: :url?
  validates :title, presence: true
  validates :url, uniqueness: true
  validates :answers, presence: true

  def has_more_than_five_answers?
    answers.map(&:count).sum >= 5
  end

  def to_csv
    CSV.generate do |csv|
      csv << ["Answer", "Count"]
      answers.each do |answer|
        csv << [answer.description, answer.count]
      end
    end
  end

  private

    def generate_url
      self.url = SecureRandom.uuid
    end
end
