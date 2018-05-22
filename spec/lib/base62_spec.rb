require 'rails_helper'

RSpec.describe Base62 do

  context ".id_to_short" do
    it "should correctly turn an int ID into a shortcode with offset" do
      expect(Base62.id_to_short(10)).to eq("GI")
    end
  end

  context ".short_to_id" do
    it "should correctly turn a shortcode back into an int ID" do
      expect(Base62.short_to_id("GI")).to eq(10)
    end

  end

end
