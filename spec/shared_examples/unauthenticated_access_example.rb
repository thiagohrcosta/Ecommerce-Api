shared_examples "unauthenticated access" do
  it "returns unautherized status" do
    expect(response).to have_http_status(:unauthorized)
  end
end