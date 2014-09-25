describe '/v1/experiences', type: :api do
  describe '#index' do
    before { create_list :experience, 4 }
    before { get v1_experiences_path }

    it 'should have 200 response' do
      expect(response.status).to eq 200
    end

    it 'should show the objects' do
      expect(response_body.size).to eq 4
    end
  end

  describe "#show" do
    before { @experience = create :experience }
    before { get v1_experience_path @experience }

    it 'should return the experience' do
      %i(name location description).each do |attr|
        expect(response_body.send(attr)).to eq @experience.send(attr)
      end
    end

    it 'should return correct price' do
      expect(response_body.price.to_f).to eq @experience.price
    end
  end

  describe "#new" do
  end

  describe "#edit" do
  end
end
