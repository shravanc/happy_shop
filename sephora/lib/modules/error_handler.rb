module ErrorHandler

#format
=begin
{
  "message": "Validation Failed",
  "errors": [
    {
      "resource": "Issue",
      "field": "title",
      "code": "missing_field"
    }
  ]
}
=end

#{:name=>["can't be blank"], :category=>["can't be blank"], :price=>["can't be blank"]}
def parse_active_record_errors errors, message=nil
	error_list = []

	errors.messages.each do |key, value|
		er = {}
		er["resource"] 	= "Issue"
		er["field"] 		= key
		er["code"]			= errors[key]
		error_list << er
	end

	message = message || "Validation Failed"
	return get_error_response( message, error_list )

end

def get_error_response message, errors

  error = {}
	error["message"] = message
	error["errors"]  = errors

  return error
end

end
