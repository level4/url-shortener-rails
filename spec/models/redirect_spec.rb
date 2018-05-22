require 'rails_helper'

RSpec.describe Redirect, type: :model do

  context ".find_by_code" do
    it "should call Base62, decode the code and send to find" do
      expect(Base62).to receive(:short_to_id) { 123 }
      expect(Redirect).to receive(:find).with(123)
      Redirect.find_by_code("abc")
    end
  end

  context "#short_url" do
    let(:record) { Redirect.create(url: "http://google.com/") }

    it "should correctly piece together URL components" do
      id = record.id
      short_code = Base62.id_to_short(id)
      expect(record.short_url).to eq("http://0.0.0.0:3000/r/#{short_code}")
    end

  end

  context "#short_code" do
    let(:record) { Redirect.create(url: "http://google.com/") }
    it "should know its own short_code" do
      target_code = Base62.id_to_short(record.id)
      expect(Base62).to receive(:id_to_short).with(record.id).and_call_original
      short_code = record.short_code
      expect(short_code).to eq(target_code)
    end
  end

end
