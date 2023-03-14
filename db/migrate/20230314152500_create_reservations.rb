class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :car, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.date :rented_from
      t.date :rented_until
      t.string :status

      t.timestamps
    end
  end
end
