class CreateFtcs < ActiveRecord::Migration
  def change
    create_table :ftcs do |t|
    	t.string :code, null: false
    	t.boolean :exception, null: false
    	t.string :shortdesc, null: false
    	t.string :longdesc, null: false
      t.timestamps null: false
    end
  end
end
