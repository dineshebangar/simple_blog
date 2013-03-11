module ApplicationHelper
	def error_messages_for( object )
	render(:partial => 'custom/error_messages', :locals => {:object => object})
	end
end
