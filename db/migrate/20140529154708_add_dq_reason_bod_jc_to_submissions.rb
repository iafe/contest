class AddDqReasonBodJcToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :disqualify_reason, :text
    add_column :submissions, :best_of_division, :boolean
    add_column :submissions, :judges_choice, :boolean
  end
end
