class RemoveMovieFromReviews < ActiveRecord::Migration[7.0]
  def change
    remove_reference :reviews, :movie, null: false, foreign_key: true
  end
end
