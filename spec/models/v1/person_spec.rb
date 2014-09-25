describe V1::Person do
  describe '#name' do
    context 'when name is too long' do
      subject { build :person, name: 'z' * 51 }
      it { is_expected.to_not be_valid }
    end

    context 'when name is not present' do
      subject { build :person, name: '' }
      it { is_expected.to_not be_valid }
    end
  end

  describe '#location' do
    subject { build :person, location: 'z' * 51 }
    it { is_expected.to_not be_valid }
  end

  describe '#bio' do
    subject { build :person, bio: '' }
    it { is_expected.to_not be_valid }
  end

  describe '#gender' do
    subject { build :person, gender: 'Mail' }
    it { is_expected.to_not be_valid }
  end

  describe '#date_of_birth' do
    subject { build :person, date_of_birth: 'A few years ago' }
    it { is_expected.to_not be_valid }
  end

  describe '#picture' do
    subject { build :person, picture_file_size: 100.megabytes }
    it { is_expected.to_not be_valid }
  end

  describe '#adventures' do
    subject { build :person_with_adventures }
    it 'should contain the adventure' do
      expect(subject.adventures.size).to be > 0
    end
  end
end
