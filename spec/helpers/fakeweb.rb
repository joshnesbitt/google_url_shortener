module FakewebHelper
  
  def stub_request(url, opts={})
    method  = opts[:method] || :get
    fixture = opts[:fixture] || "Fakeweb request body"
    body    = begin
      File.read(File.expand_path(File.dirname(__FILE__)) + "/../fixtures/#{fixture}.json")
    rescue Errno::ENOENT
      raise "Could not find fixture file named '#{fixture}'!"
    end
    
    FakeWeb.register_uri(method, url, :body => body)
  end
end
