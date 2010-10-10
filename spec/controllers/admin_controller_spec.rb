require 'spec_helper'

describe AdminController do
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs).as_null_object
  end
  before(:each) do
     request.env['warden'] = mock(Warden, :authenticate => mock_user, :authenticate! => mock_user)
  end
  it "get a list of all users" do
    User.stub(:find).with(:all).and_return([mock_user])
    get :select_user
    assigns[:users].should == [mock_user]
  end
  it "should display a list of available user permissions" do
    User.stub(:find).and_return(mock_user)
    post :edit_user_permissions, {:user_id => 1}
    assigns[:user].should == mock_user
  end
  it "should change user permission" do
    User.stub(:find).and_return(mock_user)
    post :change_user_permissions, {:user_id => 1, :roles => ["buyer", "seller"]}
  end
end