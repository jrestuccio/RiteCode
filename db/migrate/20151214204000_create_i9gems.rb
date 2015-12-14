class CreateI9gems < ActiveRecord::Migration
  def change
    create_table :i9gems do |t|
      t.text :i9code
      t.text :i10code
      t.boolean :approximate
      t.boolean :nomap
      t.boolean :combination
      t.integer :scenario
      t.integer :choicelist

      t.timestamps null: false
    end
    
    add_index  :i9gems, :i9code

  end
end
