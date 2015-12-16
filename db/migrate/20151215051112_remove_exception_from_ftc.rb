class RemoveExceptionFromFtc < ActiveRecord::Migration
  def change
    remove_column :ftcs, :exception, :boolean
  end
end
