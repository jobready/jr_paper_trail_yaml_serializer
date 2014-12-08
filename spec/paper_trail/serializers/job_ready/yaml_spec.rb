require 'spec_helper'

module CarrierWave
  module Uploader
    class Base
      def url
        "http://test.url"
      end
    end
  end
end

RSpec.describe PaperTrail::Serializers::JobReady::YAML do
  subject { described_class }

  let(:uploader_1) do
    CarrierWave::Uploader::Base.new
  end

  let(:uploader_2) do
    CarrierWave::Uploader::Base.new
  end

  describe ".dump" do
    context "serializing a hash containing CarrierWave::Uploader::Base values in it" do
      it "serializes the C::U::B urls" do
        expect(subject.dump(foo: "bar", baz: uploader_1)).
          to eq("---\n:foo: bar\n:baz: http://test.url\n")
      end
   end

    context "serializing a hash containing Array values, that have
             CarrierWave::Uploader::Base elements in them" do
      it "serializes the C::U::B urls" do
        expect(subject.dump(foo: ["bar", "baz"], baz: [uploader_1, uploader_2])).
          to eq("---\n:foo:\n- bar\n- baz\n:baz:\n- http://test.url\n- http://test.url\n")
      end
    end

    context "serializing a hash with no CarrierWave::Uploader::Base elements in it" do
      it "serializes the values without any special sanitizing" do
        expect(subject.dump(foo: "bar")).to eq("---\n:foo: bar\n")
      end
    end
  end

  describe ".load" do
    it "loads objects from YAML" do
      expect(subject.load("---\n:foo: bar\n")).to eq(foo: "bar")
    end
  end
end
