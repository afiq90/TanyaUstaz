class Answer < ActiveRecord::Base
	belongs_to :soalan
	belongs_to :user

	auto_html_for :content do ||
		html_escape
		image
		youtube(:width => 400, :height => 300, :autoplay => false)
		link :target => "blank", :rel => "nofollow"
		simple_format
	end
end
