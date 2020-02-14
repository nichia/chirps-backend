class CreateChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :chirps do |t|
      t.string :text

      t.timestamps
    end
  end
end
