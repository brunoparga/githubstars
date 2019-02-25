Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
    ENV["GITHUB_KEY"],
    ENV["GITHUB_SECRET"], {
      client_options: {
        authorize_url: "https://github.com/login/oauth/authorize?allow_signup=false"
      }
    }
end
