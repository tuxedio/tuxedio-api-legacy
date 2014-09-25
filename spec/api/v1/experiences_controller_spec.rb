describe '/v1/experiences' do
  let(:user) { create :person_with_account }
  let(:vendor) { create :vendor }

  let!(:experience) { create :experience }

  describe "GET" do
    describe "#show" do

      it "should have 200 response" do
        get '/v1/experiences'
        expect(response.status).to eq 200
      end

      it 'should show the objects' do
        get '/v1/experiences'
        expect(json_response['experiences'].size).to eq 1
      end

      it 'should return single experience' do
        get "/v1/experiences/#{experience.to_param}"
        expect(json_response['experience']['id']).to eq experience.id
      end
    end

    describe "#new" do
    end

    describe "#edit" do
    end
  end


  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new V1::Experience" do
  #       expect {
  #         post :create, v1_experience: attributes_for(:experience, vendor_id: vendor.id)
  #       }.to change(V1::Experience, :count).by 1
  #     end
  #
  #     it "assigns a newly created v1_experience as @v1_experience" do
  #       post :create, {:v1_experience => valid_attributes}
  #       assigns(:v1_experience).should be_a V1::Experience
  #       assigns(:v1_experience).should be_persisted
  #     end
  #
  #     it "redirects to the created v1_experience" do
  #       post :create, {:v1_experience => valid_attributes}
  #       response.should redirect_to V1::Experience.last
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved v1_experience as @v1_experience" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       V1::Experience.any_instance.stub(:save).and_return(false)
  #       post :create, {:v1_experience => {  }}
  #       assigns(:v1_experience).should be_a_new(V1::Experience)
  #     end
  #
  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       V1::Experience.any_instance.stub(:save).and_return(false)
  #       post :create, {:v1_experience => {  }}
  #       response.should render_template("new")
  #     end
  #   end
  # end
  #
  # describe "PUT update" do
  #   describe "with valid params" do
  #     it "updates the requested v1_experience" do
  #       experience = create :experience
  #       # Assuming there are no other v1_experiences in the database, this
  #       # specifies that the V1::Experience created on the previous line
  #       # receives the :update_attributes message with whatever params are
  #       # submitted in the request.
  #       V1::Experience.any_instance.should_receive(:update).with({ "these" => "params" })
  #       put :update, {:id => experience.to_param, :v1_experience => { "these" => "params" }}
  #     end
  #
  #     it "assigns the requested v1_experience as @v1_experience" do
  #       experience = create :experience
  #       put :update, {:id => experience.to_param, :v1_experience => valid_attributes}
  #       assigns(:v1_experience).should eq(experience)
  #     end
  #
  #     it "redirects to the v1_experience" do
  #       experience = create :experience
  #       put :update, {:id => experience.to_param, :v1_experience => valid_attributes}
  #       response.should redirect_to(experience)
  #     end
  #   end
  #
  #   describe "with invalid params" do
  #     it "assigns the v1_experience as @v1_experience" do
  #       experience = create :experience
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       V1::Experience.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => experience.to_param, :v1_experience => {  }}
  #       assigns(:v1_experience).should eq(experience)
  #     end
  #
  #     it "re-renders the 'edit' template" do
  #       experience = create :experience
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       V1::Experience.any_instance.stub(:save).and_return(false)
  #       put :update, {:id => experience.to_param, :v1_experience => {  }}
  #       response.should render_template("edit")
  #     end
  #   end
  # end
  #
  # describe "DELETE destroy" do
  #   it "destroys the requested v1_experience" do
  #     experience = create :experience
  #     expect {
  #       delete :destroy, {:id => experience.to_param}
  #     }.to change(V1::Experience, :count).by(-1)
  #   end
  #
  #   it "redirects to the v1_experiences list" do
  #     experience = create :experience
  #     delete :destroy, {:id => experience.to_param}
  #     response.should redirect_to(v1_experiences_url)
  #   end
  # end
end
