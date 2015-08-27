class AddCoverAttachmentToEvent < ActiveRecord::Migration
  def change
    remove_column :events, :cover
    add_attachment :events, :cover
  end
end
