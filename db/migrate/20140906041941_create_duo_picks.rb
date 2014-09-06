class CreateDuoPicks < ActiveRecord::Migration
  def change
    create_table :duo_picks do |t|
      t.references :week, index: true
      t.text :picks

      t.timestamps
    end
  end
end
