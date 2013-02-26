require 'spec_helper'

describe "Sinatra App" do

  it "should respond to GET" do
    get '/'
    last_response.should be_ok
    last_response.body.should match(/It works!/)
  end

  it "creates a new game" do
    data = Yajl::Encoder.encode({:name => "doug", :email => "dougdroper"})
    post '/new', :data => data
    last_response.should be_ok
    Yajl::Parser.parse(last_response.body).should == {"id"=>1, "x"=>1, "y"=>2}
  end

  it "receives a fire request" do
    data = Yajl::Encoder.encode({:id => 1, :x => 1, :y => 1})
    post '/fire', :data => data
    last_response.should be_ok
    Yajl::Parser.parse(last_response.body).should == {"id" => 1, "status" => "miss", "x" => 1, "y" => 2}
  end
end