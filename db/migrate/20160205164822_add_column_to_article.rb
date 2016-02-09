class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :name, :string
    add_column :articles, :body, :string
    add_column :articles, :user_id, :integer
  end
end
