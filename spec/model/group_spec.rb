# frozen_string_literal: true

describe Group, type: :model do
  subject { group }
  let(:group) { build(:group) }

  it { is_expected.to be_valid }
  it { is_expected.to have_attribute(:name) }

  context 'assosiation' do
    it 'has many to many relationship with permision model' do
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
