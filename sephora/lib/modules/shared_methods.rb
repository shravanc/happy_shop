module SharedMethods

def interate_list model

	model.each do |m1|
		yield m1	
	end

end

def paginate model, page, per_page

	page = page || 0
	per_page = per_page || 20

	offset = page.to_i * per_page.to_i
	per_page = per_page

	model = model.limit(per_page.to_i).offset(offset)

	return model
end

end
