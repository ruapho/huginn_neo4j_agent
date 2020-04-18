require 'rails_helper'
require 'huginn_agent/spec_helper'

describe Agents::Neo4jAgent do
  before(:each) do
    @valid_options = Agents::Neo4jAgent.new.default_options
    @checker = Agents::Neo4jAgent.new(:name => "Neo4jAgent", :options => @valid_options)
    @checker.user = users(:bob)
    @checker.save!
  end

  describe "#validate_options" do
    context "This is a test" do
      it "blablabla" do
        expect(true).to eq true
      end
    end
  end

end