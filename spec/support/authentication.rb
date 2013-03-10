RSpec.configure do |config|
  # Foreman-style .env key-value file support
  project_root = Pathname.new(__FILE__).dirname.parent.parent.realpath
  dotenv = project_root.join('.env')

  if dotenv.exist?
    dotenv.each_line do |line|
      key, value = line.split('=')
      ENV[key] = value unless value.nil?
    end
  end

  config.before(:each, :authenticated) do
    AngellistApi.configure do |al|
      al.access_token = ENV['ANGELLIST_ACCESS_TOKEN']
    end
  end
end

