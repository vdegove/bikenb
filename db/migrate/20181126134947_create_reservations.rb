class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.date :starts_at
      t.date :ends_at
      t.string :status
      t.references :bike, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
