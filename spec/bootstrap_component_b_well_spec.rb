require 'spec_helper'

describe BootstrapComponent do

  it{ expect(BootstrapComponent::VERSION).not_to be nil }
  it{ expect(BootstrapComponent::VERSION).to eq("0.1.0") }

  context "happy path" do

    context "main well" do

      context "without class attributes" do
        it "be an instance of BootstrapComponent::B_Well" do
          bw = BootstrapComponent::B_Well.new(self, {})
          expect(bw).to be_instance_of(BootstrapComponent::B_Well)
        end
        it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to eq("<div class=\"well\"></div>") }
        it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to include("class=\"well\"") }
      end

      context "with class attributes" do
        it "be an instance of BootstrapComponent::B_Well" do
          bw = BootstrapComponent::B_Well.new(self, {})
          expect(bw).to be_instance_of(BootstrapComponent::B_Well)
        end
        it{ expect(BootstrapComponent::B_Well.new(self,{class: "well-lg"}).process).to eq("<div class=\"well well-lg\"></div>") }
        it "accepts a block class attribute" do
          bw = BootstrapComponent::B_Well.new(self, {class: "well-sm"}).process do
            "<div></div>"
          end
          expect(bw).to eq("<div class=\"well well-sm\"><div></div></div>")
        end
        it "include well-sm with a block" do
          bw = BootstrapComponent::B_Well.new(self, {class: "well-sm"}).process do
            "<div></div>"
          end
          expect(bw).to include("class=\"well well-sm\"")
        end
      end

      context "id attributes" do
        it{ expect(BootstrapComponent::B_Well.new(self,{id: "well1"}).process).to eq("<div id=\"well1\" class=\"well\"></div>") }
      end

      context "id and class attributes" do
        it{ expect(BootstrapComponent::B_Well.new(self,{id: "well1", class: "well-lg"}).process).to include("id=\"well1\"",  "class=\"well well-lg\"") }
        it{ expect(BootstrapComponent::B_Well.new(self,{id: "well1", class: "well-lg"}).process).to eq("<div id=\"well1\" class=\"well well-lg\"></div>") }

        it "accepts a block in id & class attribute" do
          bw = BootstrapComponent::B_Well.new(self, {id: "well1", class: "well-sm"}).process do
            "<div></div>"
          end
          expect(bw).to eq("<div id=\"well1\" class=\"well well-sm\"><div></div></div>")
        end
      end
    end

    context "img_method" do
      context "without class attributes" do

        it "accepts without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |p|
            p.header
          end
          expect(bw).to eq("<div class=\"well\"><div class=\"caption\"><div class=\"h4\"></div></div></div>")
        end

        it "accepts with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |p|
            p.header do
              "Complete Plan Wash"
            end
          end
          expect(bw).to eq("<div class=\"well\"><div class=\"caption\"><div class=\"h4\">Complete Plan Wash</div></div></div>")
        end

      end
    end

    context "img_method" do
      let!(:opts) { {src: "/assets/services/Estates1_PNG_White_500x500.png"} }

      context "without class attributes" do
        it "accepts without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |p|
            p.img(opts)
          end
          expect(bw).to eq("<div class=\"well\"><img src=\"/assets/services/Estates1_PNG_White_500x500.png\" class=\"img\"></img></div>")
        end
        it "accepts with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.img(opts) do |img|
              img.p
            end
          end
          expect(bw).to eq("<div class=\"well\"><img src=\"/assets/services/Estates1_PNG_White_500x500.png\" class=\"img\"><p></p></img></div>")
        end
      end

      context "with class attributes" do
        before(:each){ opts.merge!({class: "img-primary"}) }

        it "accepts without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.img(opts)
          end
          expect(bw).to eq("<div class=\"well\"><img src=\"/assets/services/Estates1_PNG_White_500x500.png\" class=\"img img-primary\"></img></div>")
        end
        it "accepts with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.img(opts) do |img|
              img.p
            end
          end
          expect(bw).to eq("<div class=\"well\"><img src=\"/assets/services/Estates1_PNG_White_500x500.png\" class=\"img img-primary\"><p></p></img></div>")
        end
      end

    end

    context "p_method" do
      context "without class attributes" do
        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.p
          end
          expect(bw).to eq("<div class=\"well\"><p></p></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.p do |p|
              p.p
            end
          end
          expect(bw).to eq("<div class=\"well\"><p><p></p></p></div>")
        end
      end
      context "with class attributes" do
        let!(:opts) { {class: "p-primary"} }

        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.p(opts)
          end
          expect(bw).to eq("<div class=\"well\"><p class=\"p-primary\"></p></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.p(opts) do |p|
              p.p
            end
          end
          expect(bw).to eq("<div class=\"well\"><p class=\"p-primary\"><p></p></p></div>")
        end
      end
    end

    context "div_method" do
      context "without class attributes" do
        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.div
          end
          expect(bw).to eq("<div class=\"well\"><div></div></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.div do |div|
              div.div
            end
          end
          expect(bw).to eq("<div class=\"well\"><div><div></div></div></div>")
        end
      end
      context "with class attributes" do
        let!(:opts) { {class: "div-primary"} }

        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.div(opts)
          end
          expect(bw).to eq("<div class=\"well\"><div class=\"div-primary\"></div></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.div(opts) do |div|
              div.div
            end
          end
          expect(bw).to eq("<div class=\"well\"><div class=\"div-primary\"><div></div></div></div>")
        end
      end
    end

    context "button_method" do
      context "without class attributes" do
        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |b|
            b.button
          end
          expect(bw).to eq("<div class=\"well\"><button></button></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.button do |b|
              b.div
            end
          end
          expect(bw).to eq("<div class=\"well\"><button><div></div></button></div>")
        end
      end
      context "with class attributes" do
        let!(:opts) { {class: "btn btn-default btn-block"} }

        it "without a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.button(opts)
          end
          expect(bw).to eq("<div class=\"well\"><button class=\"btn btn-default btn-block\"></button></div>")
        end
        it "with a block" do
          bw = BootstrapComponent::B_Well.new(self, {}).process do |bw|
            bw.button(opts) do |b|
              b.div
            end
          end
          expect(bw).to eq("<div class=\"well\"><button class=\"btn btn-default btn-block\"><div></div></button></div>")
        end
      end
    end


  end

  context "unhappy path" do
    context "class attributes" do
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("class=\"\"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("class=\" \"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("class=\"well \"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("class=\" well\"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{}).process).to_not include("class=\" well \"> </div>", "id=\"\"") }

      it{ expect(BootstrapComponent::B_Well.new(self,{class: "well-lg"}).process).to_not include("class=\" well well-lg\"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{class: "well-lg"}).process).to_not include("class=\"well  well-lg\"", "id=\"\"") }
      it{ expect(BootstrapComponent::B_Well.new(self,{class: "well-lg"}).process).to_not include("class=\"well well-lg \"", "id=\"\"") }
    end

    context "id and class attributes" do
      it "accepts a block without id" do
        bw = BootstrapComponent::B_Well.new(self, {class: "well-sm"}).process do
          "<div></div>"
        end
        expect(bw).to_not eq("<div id=\"\" class=\"well well-sm\"><div></div></div>")
      end
      it "should not have missing block" do
        bw = BootstrapComponent::B_Well.new(self, {class: "well-sm"}).process do
          "<div></div>"
        end
        expect(bw).to_not eq("<div id= class=\"well well-sm\"></div>")
      end
    end

  end

  private

  def substitute(str)
    str.gsub!(/(&lt;)/, '<').gsub!(/(&gt;)/, '>')
  end

end

