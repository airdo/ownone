class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :m_id
      t.string :link
      t.integer :status
      t.timestamps null: false
    end
  end
end
