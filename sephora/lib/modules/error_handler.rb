module ErrorHandler

def parse_active_record_errors errors, code=""
		get_error_response errors.full_messages, code
end

def get_error_response error_message, code
    error_response = {}
    error_response[:code] = code
    error_response[:message] = error_message
    resp = {}
    resp[:error] = error_response
    return resp
end

end
