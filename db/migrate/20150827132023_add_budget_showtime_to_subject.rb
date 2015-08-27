class AddBudgetShowtimeToSubject < ActiveRecord::Migration
  def change
    add_column :subjects, :budget, :decimal
    add_column :subjects, :showtime, :decimal
    remove_column :subjects, :cover
    add_attachment :subjects, :cover

  end
end
