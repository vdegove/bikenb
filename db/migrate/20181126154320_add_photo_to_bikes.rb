class AddPhotoToBikes < ActiveRecord::Migration[5.2]
  def change
    add_column :bikes, :photo, :string, default: "image/upload/v1543328159/no_photo.jpg"
  end
end
