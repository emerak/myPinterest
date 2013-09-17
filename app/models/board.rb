class Board < ActiveRecord::Base
  attr_accessor :categories_name
  has_and_belongs_to_many :categories
  belongs_to :user
  before_create :associate_categories
  
  private

  def associate_categories
    if categories_name
       categories_name.split(" ").each do |name|
        self.categories << Category.find_or_create_by_name(name)
      end

    end
  
  end

end
