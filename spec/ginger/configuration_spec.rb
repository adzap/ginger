require File.dirname(__FILE__) + '/../spec_helper'

describe Ginger::Configuration do
  it "should be a singleton class" do
    Ginger::Configuration.should respond_to(:instance)
  end

  describe "instance" do

    it "should allow scenario to be defined using scenario block" do
      Ginger.configure do |c|
        c.scenario do |s|
          s.add "thinking_sphinx", "1.0"
        end
      end
      Ginger::Configuration.instance.scenarios.size.should == 1
    end

    it "should define scenario with options passed to scenario block" do
      Ginger.configure do |c|
        c.scenario('Version 1') do |s|
          s.add "thinking_sphinx", "1.0"
        end
      end
      Ginger::Configuration.instance.scenarios.first.name.should == 'Version 1'
    end

    after do
      Ginger::Configuration.instance.scenarios = []
    end

  end
end
