class CreateAspectAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :aspect_assignments do |t|
      t.references :location, null: false, foreign_key: true
      t.references :aspect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
