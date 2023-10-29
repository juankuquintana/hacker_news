class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :reference_id
      t.text :content
      t.bigint :time
      t.string :author
      t.jsonb :metadata
      t.boolean :deleted
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
