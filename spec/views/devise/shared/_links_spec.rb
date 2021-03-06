describe 'devise/shared/_links.haml', :type => "view" do

  def devise_mapping(register, recover, confirm, lock, oauth)
    dm = mock("mappings")
    dm.stub(:registerable? => register)
    dm.stub(:recoverable? => recover)
    dm.stub(:confirmable? => confirm)
    dm.stub(:lockable? => lock)
    dm.stub(:omniauthable? => oauth)
    return dm
  end

  it 'should have a sign-in link if not in sessions' do
    @view.stub(:controller_name).and_return("anything but sessions")
    @view.stub(:resource_name).and_return("user")
    @view.stub(:devise_mapping =>
               devise_mapping(false, false, false, false, false))
    render
  end

  it "shouldn't have a sign-in link if in sessions" do
    @view.stub(:controller_name).and_return("sessions")
    @view.stub(:resource_name).and_return("user")
    @view.stub(:devise_mapping =>
               devise_mapping(false, false, false, false, false))
    render
  end
end
