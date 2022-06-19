RSpec.describe(ZktClient::TokenGenerator) do
  describe '#access_token' do
    subject { described_class.instance }
    # before do
    #   ZktClient.configure do |config|
    #     config.username = 'username'
    #     config.password = 'password'
    #   end
    # end

    it 'returns a token' do
      VCR.use_cassette('successful_token') do
        expect(subject.access_token.present?).to be_truthy
      end
    end
  end
end
