class CreateStories < ActiveRecord::Migration[7.0]
  def change
    create_table :stories do |t|
      t.integer :reference_id
      t.text :title
      t.text :url
      t.bigint :time
      t.string :author
      t.boolean :deleted
      t.integer :rank
      t.jsonb :metadata

      t.timestamps
    end
  end
end
