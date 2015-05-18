module Devise
  module Strategies
    class ClerkStrategie < Base
      def valid?
        params["user"] || params["password"]
      end

      def authenticate!
        # Get email and password
        email = params["email"]
        password = params["password"]

        # Try to login
        user = Clerk.find_by(email: email)

        if user.nil?
          fail!("Clerk login failed.")
        else
          if user.valid_password?(password)
            success!(user)
          else
            fail!("Invalid Password")
          end
        end
      end
    end
  end
end