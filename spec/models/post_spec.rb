require "minitest/autorun"
require_relative "../../app/models/post"

describe Post do
  before do
    @it = Post.new
  end

  it "starts with blank attributes" do
    @it.title.must_be_nil
    @it.body.must_be_nil
  end

  it "supports reading and writing a title" do
    title = "foo"
    @it.title = title
    @it.title.must_equal title
  end

  it "supports reading and writing a post body" do
    body = "bar"
    @it.body = body
    @it.body.must_equal body
  end

  it "supports reading and writing a blog reference" do
    blog = Object.new
    @it.blog = blog
    @it.blog.must_equal blog
  end

  it "supports setting attributes in the initializer" do
    title = "El"
    body = "Psy"
    it = Post.new(title: title, body: body)
    it.title.must_equal title
    it.body.must_equal body
  end

  describe "#publish" do
    before do
      @blog = MiniTest::Mock.new
      @it.blog = @blog
    end

    after do
      @blog.verify
    end

    it "adds the post to the blog" do
      @blog.expect :add_entry, nil, [@it]
      @it.publish
    end
  end
end
