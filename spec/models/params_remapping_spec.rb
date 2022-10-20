RSpec.describe ParamsRemapping, type: :model do
  describe "associations" do
    it { should belong_to(:route) }
  end

  describe ".keys_present?" do
    context "when both initial_key and remapped_key present" do
      subject { create(:params_remapping) }

      it { should be_keys_present }
    end

    context "when both initial_key and remapped_key not present" do
      subject { create(:params_remapping, initial_key: nil, remapped_key: nil) }

      it { should_not be_keys_present }
    end

    context "when one of initial_key and remapped_key not present" do
      subject { create(:params_remapping, initial_key: nil) }

      it { should_not be_keys_present }
    end
  end

  describe ".values_present?" do
    context "when both initial_value and remapped_value present" do
      subject { create(:params_remapping) }

      it { should be_values_present }
    end

    context "when both initial_value and remapped_value not present" do
      subject { create(:params_remapping, initial_value: nil, remapped_value: nil) }

      it { should_not be_values_present }
    end

    context "when one of initial_value and remapped_value not present" do
      subject { create(:params_remapping, initial_value: nil) }

      it { should_not be_values_present }
    end
  end
end
