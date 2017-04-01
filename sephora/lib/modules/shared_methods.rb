module SharedMethods

def interate_list model

	model.each do |m1|
		yield m1	
	end

end


end
