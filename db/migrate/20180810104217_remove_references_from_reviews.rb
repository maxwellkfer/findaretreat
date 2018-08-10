class RemoveReferencesFromReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, foreign_key: true
    remove_reference :reviews, :venue, foreign_key: true
  end
end
