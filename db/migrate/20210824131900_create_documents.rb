class CreateDocuments < ActiveRecord::Migration[6.1]
  def change
    create_table :documents do |t|
      t.string :title
      t.timestamps
    end
    add_column :videos, :minutes, :integer
  end
end
