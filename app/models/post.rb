class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction']}
  validate :clickbaity

  def clickbaity
    if title.nil?
      false
    else
      if ["Won't Believe", 'Secret', 'Top [1..9]', 'Guess'].none? { |clickbait| title.include? clickbait }
        errors.add(:title, "must contain clickbait")
      end
    end
  end
end
