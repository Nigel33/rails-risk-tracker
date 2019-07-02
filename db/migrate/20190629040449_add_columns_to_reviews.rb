class AddColumnsToReviews < ActiveRecord::Migration[5.2]
  def change
  	add_column :reviews, :accuracy, :float
  	add_column :reviews, :timeliness, :float
  	add_column :reviews, :grammar, :float
  	add_column :reviews, :detail, :float
  	add_column :reviews, :comment, :text
  end
end
