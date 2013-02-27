require 'spec_helper'

describe "Sinatra App" do

  it "creates a new game" do
    RedisStorage.any_instance.stub(:incr => 1, :set => stub)
    data = Yajl::Encoder.encode({:name => "doug", :email => "dougdroper"})
    post '/new', :data => data
    last_response.should be_ok
    Yajl::Parser.parse(last_response.body).should == {"id" => "users:doug:1", "x"=>1, "y"=>1}
  end

  it "receives a fire request" do
    RedisStorage.any_instance.stub(:incr => 1, :get => stub(:status => "miss"), :set => stub)
    data = Yajl::Encoder.encode({:id => 'users:doug:1', :x => 1, :y => 1})
    post '/fire', :data => data
    last_response.should be_ok
    Yajl::Parser.parse(last_response.body).should ==  {"id"=>"users:doug:1", "x"=>1, "y"=>1, "status"=>"miss"}
  end

  it "404 receives a fire request with no game" do
    Board.any_instance.stub(:status => "miss")
    RedisStorage.any_instance.stub(:incr => 1, :get => nil, :set => stub)
    data = Yajl::Encoder.encode({:id => 'users:doug:1', :x => 1, :y => 1})
    post '/fire', :data => data
    Yajl::Parser.parse(last_response.body).should == {"error"=>"no game in progress"}
  end
end