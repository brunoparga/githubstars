Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github,
           ENV['GITHUB_KEY'],
           ENV['GITHUB_SECRET'],
           client_options: { authorize_url: "https://localhost:3000/login/oauth/authorize?allow_signup=false" }
end
