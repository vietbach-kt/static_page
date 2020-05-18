module UsersHelper
    def gravatar_for(user, options = { size: 80 })
        size = options[:size]
        gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
        image_tag(gravatar_url, alt: user.name, class: "gravatar")
        end
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end
    def logged_in?
        !current_user.nil?
    end
      # Confirms the correct user.
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_url) unless current_user?(@user)
    end
end
