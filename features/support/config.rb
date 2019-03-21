class Config
  attr_reader :config

  CONFIG_FILE = 'config.yml'

  def initialize
    if File.exist? CONFIG_FILE
      @config = YAML.load_file(CONFIG_FILE)
      raise 'configuration not loaded successfully' if @config.nil?
    else
      raise 'Missing configuration file'
    end
  end
end
