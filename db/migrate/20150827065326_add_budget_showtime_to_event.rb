class AddBudgetShowtimeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :budget, :decimal
    add_column :events, :showtime, :decimal
  end
end
