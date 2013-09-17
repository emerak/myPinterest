class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

    end
    
    create_table :boards_categories, id: false do |t|
      t.integer :board_id, :category_id
    end
  
  end
end
