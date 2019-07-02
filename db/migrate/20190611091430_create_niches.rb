class CreateNiches < ActiveRecord::Migration[5.2]
  def change
    create_table :niches do |t|
    	t.string :type
    	t.timestamps
    end
  end
end
