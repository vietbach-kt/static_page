module UsersHelper
    # def gravatar_for(user)
    #     gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    #     gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #     image_tag(gravatar_url, alt: user.name, class: "gravatar")
    # end
    def log_in(user)
        session[:user_id] = user.id
    end
    def log_out
        session.delete(:user_id)
        @current_user = nil
    end
end
