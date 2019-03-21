require_relative 'lib/testrail'

class ResultUploader

  attr_accessor :client

  def initialize(scenario)
    @scenario = scenario
    @config = Config.new.config['testrail']
    setup_testrail_client
  end

  def upload_result
    puts 'uploading test case result to testrail...'

    response = {}
    case_id = @scenario.name.split(' ').first.scan(/\d+/).first rescue nil
    status_id = get_status_id @scenario.status
    run_id = @config['run_id']

    if case_id && run_id
      response = client.send_post(
          "add_result_for_case/#{run_id}/#{case_id}",
          { status_id: status_id }
      )
    else
      raise 'unable to get case id or run id'
    end

    puts 'result uploaded successfully.'
    response
  end

  def fetch_status_ids
    client.send_get('get_statuses')
  end

  private

  def setup_testrail_client
    @client = TestRail::APIClient.new(@config['url'])
    @client.user = @config['user']
    @client.password = @config['password']
  end

  def get_status_id(status)
    case status
    when :passed
      1
    when :blocked
      2
    when :untested
      3
    when :retest
      4
    when :failed
      5
    when :undefined
      raise 'missing step definition'
    else
      raise 'unexpected scenario status passed'
    end
  end
end
