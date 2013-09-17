class Category < ActiveRecord::Base
  has_and_belongs_to_many :boards
  scope :search_by_category, ->(category) do
    where(id: category)
  end

end
