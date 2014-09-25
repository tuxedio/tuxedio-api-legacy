describe '/v1/people', type: :api do
  describe '#index' do
    before { create_list :person, 4 }
    before { get v1_people_path }

    it 'should return 200 response' do
      expect(response).to be_success
    end

    it 'should show the objects' do
      expect(response_body.size).to eq 4
    end
  end

  describe "#show" do
    before { @person = create :person_with_account }
    before { get v1_person_path @person }

    it 'should return the person' do
      attrs = %i(bio gender hometown location name)

      attrs.each do |attr|
        expect(response_body.person.send(attr)).to eq @person.send(attr)
      end
    end

    it 'should return the user account' do
      expect(response_body.person.user.email).to eq @person.user.email
    end
  end

  describe "#create" do
    before { @person_with_acct = json :person_with_account }
    before { post v1_people_path, @person_with_acct, headers_for(:json) }

    let(:user_attrs) { { email: 'bob@bob.com', password: 'foobar123' } }
    let(:person_user) { json :person_nested_user, user_attributes: user_attrs }

    it 'should return 200 response' do
      expect(response).to be_success
    end

    it 'should create the person' do
      expect{ post v1_people_path, @person_with_acct, headers_for(:json) }
        .to change(V1::Person, :count).by 1
    end

    it 'should create the user' do
      expect{ post v1_people_path, person_user, headers_for(:json) }
        .to change(V1::User, :count).by 1
    end

    it 'should return the created person' do
      attrs = %i(bio gender hometown location name)

      attrs.each do |attr|
        expect(response_body.person.send(attr)).to eq parse_json(@person_with_acct).person.send(attr)
      end
    end

    it 'should return the created user' do
      post v1_people_path, person_user, headers_for(:json)
      expect(response_body.person.user.email).to eq 'bob@bob.com'
    end

    it 'should not return the password' do
      post v1_people_path, person_user, headers_for(:json)
      expect(response_body.person.user).to_not include 'password'
    end
  end

  describe '#update' do
    subject { V1::Person.find person }

    let(:person) { create :person }
    let(:updated_person_json) {json :person, name: 'Bobby'}

    before { put v1_person_path(person), updated_person_json, headers_for(:json) }

    it 'should return 200 response' do
      expect(response).to be_success
    end

    it 'should update the record' do
      expect(subject.name).to eq 'Bobby'
    end

    it 'should only update records of authenticated user' do
      skip
    end

    it 'should responsd with no content' do
      expect(response).to have_http_status 204
    end
  end

  describe '#delete' do
    before { @person = create :person_with_account }

    it 'should return 200 response' do
      delete v1_person_path(@person)
      expect(response).to be_success
    end

    it 'should decrease person count by one' do
      expect { delete v1_person_path(@person) }.to change(V1::Person, :count).by -1
    end

    it 'should decrease user count by one' do
      expect { delete v1_person_path(@person) }.to change(V1::User, :count).by -1
    end

    it 'should only delete records of authenticated user' do
      skip
    end
  end
end
