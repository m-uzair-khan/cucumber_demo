require_relative 'testrail'

class ResultUploader

  attr_accessor :client
  attr_reader :config

  CONFIG_FILE = 'config.yml'

  def initialize(scenario)
    @scenario = scenario
    load_config
    setup_testrail_client
  end

  def upload_result
    # client.send_get('get_statuses')
    p @scenario
  end

  private

  def setup_testrail_client
    @client = TestRail::APIClient.new(@config['url'])
    @client.user = @config['user']
    @client.password = @config['password']
  end

  def load_config
    if File.exist? CONFIG_FILE
      @config = YAML.load_file(CONFIG_FILE)['testrail']
      raise 'configuration not loaded successfully' if @config.nil?
    else
      raise 'Missing configuration file'
    end
  end
end
