module ApplicationHelper

    #view helper method
    def login_helper
        if current_user.is_a?(User)
            link_to 'Logout', destroy_user_session_path, method: :delete
        else
            (link_to 'Register', new_user_registration_path) + " " +
            (link_to 'Login', new_user_session_path)
        end
    end

    # content helper method
    def source_helper(layout)
        if session[:source]
            content_tag :footer, "Thanks for visiting me  #{session[:source]}, you are on #{layout} layout"
        end
    end

    def copyright_generator
        KarunsViewTool::Renderer.copyright "Karun Rajagopal", "All rights reserved"
    end
  
end
