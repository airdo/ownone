class CreateMatchesLists < ActiveRecord::Migration
  def change
    create_table :matches_lists do |t|
      t.string :team1
      t.string :team2
      t.string :t1_logo
      t.string :t2_logo
      t.string :t1_score
      t.string :t2_score
      t.string :link
      t.integer :m_id
      t.integer :status
      t.integer :result
      t.integer :format
      t.integer :game_num

      t.timestamps null: false
    end
  end
end
