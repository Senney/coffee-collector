
client = OpenAI::Client.new(
  access_token: ENV.fetch("OPENAI_API_KEY", ""),
  log_errors: true
)

Rails.application.config.openai_client = client
