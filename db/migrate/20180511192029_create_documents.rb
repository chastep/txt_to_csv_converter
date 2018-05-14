class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.string :original
      t.string :csv

      t.timestamps
    end
  end
end
