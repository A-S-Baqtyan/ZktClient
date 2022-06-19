module ZktClient
  module Constants
    PATH = {
      'ZktClient::Models::Area'        => '/personnel/api/areas/',
      'ZktClient::Models::Position'    => '/personnel/api/positions/',
      'ZktClient::Models::Terminal'    => '/iclock/api/terminals/',
      'ZktClient::Models::Employee'    => '/personnel/api/employees/',
      'ZktClient::Models::Department'  => '/personnel/api/departments/',
      'ZktClient::Models::Transaction' => '/iclock/api/transactions/'
    }.freeze
  end
end
