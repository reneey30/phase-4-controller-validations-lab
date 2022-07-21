class Post < ApplicationRecord
    validates :category, inclusion: { in: %w[Fiction Non-Fiction] }
    validates :content, length: { minimum: 100}
    validates :title, presence: true
end
