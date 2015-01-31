class AddContentHtmlToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :content_html, :text
  end
end
