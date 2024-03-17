module AuthHelpers
  def auth_with_user(_user)
    allow_any_instance_of(ApplicationController).to receive(:authenticate_request).and_return(true)
  end
end
