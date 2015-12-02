class Answer < ActiveRecord::Base
  belongs_to :question
  validates :description, presence: true, length: { maximum: 300 }
end
