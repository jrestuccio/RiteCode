class CreateI10gems < ActiveRecord::Migration
  def change
    create_table :i10gems do |t|
      t.text :i10code
      t.text :i9code
      t.boolean :approximate
      t.boolean :nomap
      t.boolean :combination
      t.integer :scenario
      t.integer :choicelist

      t.timestamps null: false
    end
  end
end
