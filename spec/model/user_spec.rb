# frozen_string_literal: true

describe User, type: :model do
  subject { user }
  let(:user) { build(:user) }

  it { is_expected.to be_valid }
  it { is_expected.to have_attribute(:username) }

  context 'assosiation' do
    it 'has many to many relationship with perrmision model' do
      expect(subject.permissions).to eq []
    end
    it 'has many to many relationship with group model' do
      expect(subject.permissions).to eq []
    end
    it 'has many to many relationship with subject model' do
      expect(subject.permissions).to eq []
    end
  end
end
