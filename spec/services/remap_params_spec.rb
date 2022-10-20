RSpec.describe RemapParams do

  describe ".call" do
    context "when only keys present" do
      let(:params_remapping) do
        create(:params_remapping, initial_key: "test", remapped_key: "test1", initial_value: nil, remapped_value: nil)
      end
      let(:inbound_params) { {test: "hello world"}.with_indifferent_access }

      it "remaps params keys" do
        described_class.new(route: params_remapping.route, inbound_params: inbound_params).call

        expect(inbound_params.keys.first.to_s).to eq(params_remapping.remapped_key)
      end
    end

    context "when values with initial key present" do
      let(:params_remapping) do
        create(:params_remapping, initial_key: "test", remapped_key: nil, initial_value: "test", remapped_value: "test1")
      end
      let(:inbound_params) { {test: "test"}.with_indifferent_access }

      it "remaps params values for certain key" do
        described_class.new(route: params_remapping.route, inbound_params: inbound_params).call

        expect(inbound_params.values.first.to_s).to eq(params_remapping.remapped_value)
      end
    end

    context "when only values" do
      let(:params_remapping) do
        create(:params_remapping, initial_key: nil, remapped_key: nil, initial_value: "test", remapped_value: "test1")
      end
      let(:inbound_params) { {test: "test", test1: "test"}.with_indifferent_access }

      it "remaps params all values" do
        described_class.new(route: params_remapping.route, inbound_params: inbound_params).call

        expect(inbound_params.values.uniq).to eq([params_remapping.remapped_value])
      end
    end
  end
end
